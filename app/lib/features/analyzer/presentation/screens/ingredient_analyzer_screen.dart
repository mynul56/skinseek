import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/features/home/presentation/widgets/home_widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinseek_app/features/analyzer/presentation/riverpod/analyzer_provider.dart';
import 'package:skinseek_app/features/analyzer/presentation/screens/ai_analysis_screen.dart';

class IngredientAnalyzerScreen extends ConsumerStatefulWidget {
  const IngredientAnalyzerScreen({super.key});

  @override
  ConsumerState<IngredientAnalyzerScreen> createState() => _IngredientAnalyzerScreenState();
}

class _IngredientAnalyzerScreenState extends ConsumerState<IngredientAnalyzerScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Stack(
        children: [
          // Background Decorative Elements
          Positioned(
            right: -132,
            top: MediaQuery.of(context).size.height / 2 - 250,
            child: Opacity(
              opacity: 0.03,
              child: ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDvu-wYqi3UBklKwb2BtPjoV8mZfdalW-wVQilVHah8jvy7s4viSNuer8FJ3B2sXutCbAsusWuvdmmSvdWLL8NVyk0Burq3PrNP7GgKwbRUdwqqJ3NtcYx1UGyZ7YLDBfUD1IVCZLczkeRAoXTlo0gT_hCnv6863Rhbnk1Wl3nzhCFnfzl9L-a0pCnRWinuLqvGjKNU1QnjrML8GJG026uvs4MYG3gh9kf7RPNKQdZVSZ00YqohzyeaPcSWKIeRqqQqDkohsTLMf_2O',
                  width: 500,
                  height: 500,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: -80,
            bottom: 0,
            child: Opacity(
              opacity: 0.05,
              child: Container(
                width: 256,
                height: 256,
                decoration: BoxDecoration(
                  color: const Color(0xFF675D53),
                  borderRadius: BorderRadius.circular(128),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 48, sigmaY: 48),
                  child: Container(color: Colors.transparent),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const HomeHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 12),
                        // Header Section
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ingredient ',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF675D53),
                                ),
                              ),
                              TextSpan(
                                text: 'Analyzer',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: const Color(0xFF735C00),
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Advanced molecular decoding to reveal the clean beauty truth behind your products.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: const Color(0xFF4D453F).withValues(alpha: 0.8),
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Tool Cards Grid
                        Row(
                          children: [
                            Expanded(
                              child: _ToolCard(
                                icon: Icons.center_focus_weak,
                                label: 'SCAN',
                                title: 'Barcode',
                                onTap: () {},
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _ToolCard(
                                icon: Icons.photo_camera,
                                label: 'SCAN',
                                title: 'Label',
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Manual Input area
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'MANUAL INPUT',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF735C00),
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF735C00).withValues(alpha: 0.05),
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(color: const Color(0xFF735C00).withValues(alpha: 0.1)),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.auto_awesome, size: 12, color: Color(0xFF735C00)),
                                        const SizedBox(width: 6),
                                        Text(
                                          'AI ANALYSIS READY',
                                          style: GoogleFonts.inter(
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF735C00),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 224,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF675D53).withValues(alpha: 0.05),
                                    blurRadius: 32,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                                  child: TextField(
                                    controller: _controller,
                                    maxLines: null,
                                    expands: true,
                                    decoration: InputDecoration(
                                      hintText: 'Paste the ingredient list here (e.g., Aqua, Glycerin, Niacinamide...)',
                                      hintStyle: GoogleFonts.inter(
                                        color: const Color(0xFFD0C4BC).withValues(alpha: 0.8),
                                        fontSize: 15,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.all(24),
                                      fillColor: Colors.white.withValues(alpha: 0.4),
                                      filled: true,
                                    ),
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      color: const Color(0xFF1A1C1A),
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 48),

                        // Analyze Button
                        _ShimmerButton(
                          onTap: () {
                            if (_controller.text.trim().isEmpty) return;
                            ref.read(analyzerStateProvider.notifier).analyze(_controller.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const AIAnalysisScreen()),
                            );
                          },
                          text: 'Analyze Now',
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Color(0xFF675D53),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'SKINSEEK NEURAL ENGINE V4.2',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1A1C1A).withValues(alpha: 0.4),
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ToolCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String title;
  final VoidCallback onTap;

  const _ToolCard({
    required this.icon,
    required this.label,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 190,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF675D53).withValues(alpha: 0.05),
              blurRadius: 32,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF675D53).withValues(alpha: 0.15),
                        blurRadius: 40,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(icon, size: 32, color: const Color(0xFF675D53), weight: 300),
                ),
                const SizedBox(height: 20),
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF765847),
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF675D53),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ShimmerButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _ShimmerButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 320),
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          colors: [Color(0xFF71665D), Color(0xFF4E453C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF675D53).withValues(alpha: 0.3),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
