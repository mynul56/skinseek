import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';
import '../widgets/scanner_overlay_painter.dart';
import 'dart:ui';
import 'dart:typed_data';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinseek_app/features/analyzer/data/analyzer_repository.dart';
import 'package:skinseek_app/features/analyzer/presentation/screens/analysis_result_screen.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class AdvancedScannerScreen extends ConsumerStatefulWidget {
  const AdvancedScannerScreen({super.key});

  @override
  ConsumerState<AdvancedScannerScreen> createState() => _AdvancedScannerScreenState();
}

class _AdvancedScannerScreenState extends ConsumerState<AdvancedScannerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _scanController;
  late final MobileScannerController _cameraController;
  final TextRecognizer _textRecognizer = TextRecognizer();
  final ImagePicker _picker = ImagePicker();
  
  Uint8List? _lastFrame;
  bool isOcrMode = true;
  bool isFlashOn = false;
  bool _isProcessing = false;
  String? _loadingMessage;

  @override
  void initState() {
    super.initState();
    _cameraController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
      returnImage: true,
    );
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _scanController.dispose();
    _textRecognizer.close();
    super.dispose();
  }

  Future<void> _processBarcode(String code) async {
    if (_isProcessing) return;
    setState(() {
      _isProcessing = true;
      _loadingMessage = 'Identifying Product...';
    });

    try {
      final repo = ref.read(analyzerRepositoryProvider);
      final product = await repo.lookupBarcode(code);
      
      if (product != null && product['ingredients'] != null) {
        setState(() => _loadingMessage = 'Analyzing Ingredients...');
        final result = await repo.analyzeIngredients(
          ingredients: product['ingredients'],
        );
        
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => AnalysisResultScreen(result: result)),
          );
        }
      } else {
        _handleError('Product not found in our database.');
      }
    } catch (e) {
      _handleError('Analysis failed. Please try again.');
    }
  }

  Future<void> _processImage(InputImage image) async {
    setState(() {
      _isProcessing = true;
      _loadingMessage = 'Extracting Text...';
    });

    try {
      final RecognizedText recognizedText = await _textRecognizer.processImage(image);
      final String fullText = recognizedText.text;
      
      if (fullText.trim().isEmpty) {
        _handleError('No text found in image.');
        return;
      }

      setState(() => _loadingMessage = 'AI Analysis in progress...');
      final repo = ref.read(analyzerRepositoryProvider);
      final result = await repo.analyzeIngredients(ingredients: fullText);
      
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AnalysisResultScreen(result: result)),
        );
      }
    } catch (e) {
      _handleError('Failed to parse text. Use clearer lighting.');
    }
  }

  Future<void> _pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _processImage(InputImage.fromFilePath(image.path));
    }
  }

  Future<void> _capturePhoto() async {
    if (_lastFrame == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No frame captured yet. Point the camera at a label.")),
      );
      return;
    }
    
    // Process the bytes from the last captured frame
    _processImage(InputImage.fromBytes(
      bytes: _lastFrame!,
      metadata: InputImageMetadata(
        size: const Size(1080, 1920), // Placeholder, usually extracted from capture
        rotation: InputImageRotation.rotation0deg,
        format: InputImageFormat.bgra8888,
        bytesPerRow: 1080 * 4,
      ),
    ));
  }

  void _handleError(String message) {
    if (!mounted) return;
    setState(() {
      _isProcessing = false;
      _loadingMessage = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Camera Viewfinder (Original SDK will be integrated here)
          Positioned.fill(
            child: MobileScanner(
              controller: _cameraController,
              onDetect: (capture) {
                // Update last frame for capture
                if (capture.image != null) {
                  _lastFrame = capture.image;
                }

                if (_isProcessing) return;
                
                // Only auto-process in Barcode mode
                if (!isOcrMode) {
                  final barcodes = capture.barcodes;
                  if (barcodes.isNotEmpty) {
                    final code = barcodes.first.rawValue;
                    if (code != null) {
                      _processBarcode(code);
                    }
                  }
                }
              },
            ),
          ),

          // 2. Custom Scanner Overlay & Animation
          AnimatedBuilder(
            animation: _scanController,
            builder: (context, child) {
              return CustomPaint(
                size: Size.infinite,
                painter: ScannerOverlayPainter(
                  scanLineOffset: _scanController.value,
                ),
              );
            },
          ),

          // 3. Header (Back Button)
          Positioned(
            top: 60,
            left: 24,
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                padding: const EdgeInsets.all(12),
              ),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),

          // 4. Alignment Hint
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 280), // Offset to bottom of frame
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Text(
                        'Align ingredient list within the frame',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 5. Hint Toast (Top Center)
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.lightbulb, color: Color(0xFF735C00), size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'Hold steady for AI analysis',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.splashOnSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 6. Bottom Controls
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Mode Toggle
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _ModeButton(
                            label: 'Label / OCR',
                            icon: Icons.auto_fix_high,
                            isSelected: isOcrMode,
                            onTap: () => setState(() => isOcrMode = true),
                          ),
                           _ModeButton(
                            label: 'Barcode',
                            icon: Icons.qr_code_scanner,
                            isSelected: !isOcrMode,
                            onTap: () {
                              _cameraController.stop();
                              setState(() => isOcrMode = false);
                              _cameraController.start();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Buttons Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _CircleControl(
                        icon: Icons.image,
                        onTap: _pickFromGallery,
                      ),
                      _CaptureButton(
                        onTap: isOcrMode ? _capturePhoto : null,
                      ),
                      _CircleControl(
                        icon: isFlashOn ? Icons.flash_on : Icons.flashlight_on,
                        onTap: () async {
                          await _cameraController.toggleTorch();
                          setState(() => isFlashOn = !isFlashOn);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // 7. Loading Overlay
          if (_isProcessing)
            Positioned.fill(
              child: Container(
                color: Colors.black.withValues(alpha: 0.6),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(
                          color: Color(0xFFF5E6DA),
                          strokeWidth: 3,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          _loadingMessage ?? 'Processing...',
                          style: GoogleFonts.manrope(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFFF5E6DA), Color(0xFF675D53)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label.toUpperCase(),
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
                color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleControl extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleControl({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.2),
        padding: const EdgeInsets.all(12),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
      ),
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white),
    );
  }
}

class _CaptureButton extends StatelessWidget {
  final VoidCallback? onTap;
  const _CaptureButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onTap == null ? 0.5 : 1.0,
      child: Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black.withValues(alpha: 0.1), width: 4),
            gradient: const LinearGradient(
              colors: [Color(0xFFF5E6DA), Color(0xFF675D53)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
