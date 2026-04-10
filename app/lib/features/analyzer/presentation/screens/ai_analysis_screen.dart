import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/features/home/presentation/widgets/home_widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinseek_app/features/analyzer/presentation/riverpod/analyzer_provider.dart';
import 'package:skinseek_app/features/analyzer/presentation/screens/analysis_result_screen.dart';

class AIAnalysisScreen extends ConsumerStatefulWidget {
  const AIAnalysisScreen({super.key});

  @override
  ConsumerState<AIAnalysisScreen> createState() => _AIAnalysisScreenState();
}

class _AIAnalysisScreenState extends ConsumerState<AIAnalysisScreen> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotateController;
  late AnimationController _messageController;
  
  int _messageIndex = 0;
  final List<String> _messages = [
    'Analyzing ingredients...',
    'Checking molecular safety...',
    'Mapping texture profiles...',
    'Synthesizing skin compatibility...',
  ];

  @override
  void initState() {
    super.initState();
    
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat();

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _messageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Message cycling logic
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) return;
      setState(() {
        _messageIndex = (_messageIndex + 1) % _messages.length;
      });
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotateController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(analyzerStateProvider, (previous, next) {
      if (next is AsyncData && next.value != null && previous?.value != next.value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => AnalysisResultScreen(result: next.value!),
          ),
        );
      } else if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error.toString())),
        );
        Navigator.pop(context);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Stack(
        children: [
          // Background Decorative Elements
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: -80,
            child: Container(
              width: 384,
              height: 384,
              decoration: BoxDecoration(
                color: const Color(0xFFF5E6DA).withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            right: -80,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                color: const Color(0xFF735C00).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const HomeHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        
                        // Central Loading Component
                        SizedBox(
                          height: 300,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Outer Static Orbit
                              Container(
                                width: 256,
                                height: 256,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF735C00).withValues(alpha: 0.1),
                                  ),
                                ),
                              ),
                              
                              // Pulsing Rings
                              AnimatedBuilder(
                                animation: _pulseController,
                                builder: (context, child) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: List.generate(2, (index) {
                                      final progress = (_pulseController.value + (index * 0.5)) % 1.0;
                                      return Container(
                                        width: 192 + (64 * progress),
                                        height: 192 + (64 * progress),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: const Color(0xFF735C00).withValues(alpha: 0.4 * (1.0 - progress)),
                                            width: 2,
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                              
                              // Spinning gold ring
                              RotationTransition(
                                turns: _rotateController,
                                child: CustomPaint(
                                  size: const Size(192, 192),
                                  painter: _GoldRingPainter(),
                                ),
                              ),
                              
                              // Inner Core
                              Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.08),
                                      blurRadius: 32,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.flare,
                                    color: Color(0xFF735C00),
                                    size: 48,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 40),
                        
                        // Cycling Messages
                        SizedBox(
                          height: 48,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 800),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0, 0.5),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                ),
                              );
                            },
                            child: Text(
                              _messages[_messageIndex],
                              key: ValueKey<int>(_messageIndex),
                              style: GoogleFonts.manrope(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF675D53),
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        Text(
                          'SKINSEEK AI ENGINE V2.4',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF4D453F).withValues(alpha: 0.6),
                            letterSpacing: 2.0,
                          ),
                        ),
                        
                        const SizedBox(height: 60),
                        
                        // Bento Grid
                        const _ProgressGrid(),
                        
                        const SizedBox(height: 48),
                        
                        // Insight Card
                        const _InsightCard(),
                        
                        const SizedBox(height: 40),
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

class _GoldRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF735C00)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw only a portion of the circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1,
      2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ProgressGrid extends StatelessWidget {
  const _ProgressGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _BentoCard(
                icon: Icons.biotech,
                title: 'Molecular Mapping',
                progress: 0.75,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _BentoCard(
                icon: Icons.verified_user,
                title: 'Safety Screen',
                progress: 1.0,
                isAnimating: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const _BentoCard(
          icon: Icons.auto_awesome,
          title: 'Texture Scan',
          progress: 0.5,
          fullWidth: true,
        ),
      ],
    );
  }
}

class _BentoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final double progress;
  final bool isAnimating;
  final bool fullWidth;

  const _BentoCard({
    required this.icon,
    required this.title,
    required this.progress,
    this.isAnimating = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: const Color(0xFF675D53), size: 24),
              const SizedBox(height: 12),
              Text(
                title,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A1C1A),
                ),
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    height: 4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEEEB),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  if (isAnimating)
                    const _AnimatedProgressBar()
                  else
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFF675D53),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedProgressBar extends StatefulWidget {
  const _AnimatedProgressBar();

  @override
  State<_AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<_AnimatedProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FractionallySizedBox(
          widthFactor: 0.4 + (_controller.value * 0.6),
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFF675D53),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      },
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF5E6DA).withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lightbulb,
                  color: Color(0xFF735C00),
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Did you know?',
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF675D53),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Niacinamide is most effective when paired with hydrating humectants like Hyaluronic Acid. We\'re checking that now.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF4D453F),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
