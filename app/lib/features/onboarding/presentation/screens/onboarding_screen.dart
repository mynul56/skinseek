import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';
import 'package:skinseek_app/features/auth/presentation/screens/landing_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.splashGradientStart,
      body: Stack(
        children: [
          // Ambient Background Elements
          Positioned(
            top: -100,
            right: -100,
            child: _BlurredCircle(
              size: 256,
              color: AppTheme.splashAmbient1.withOpacity(0.3),
              blur: 80,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5 - 160,
            left: -128,
            child: _BlurredCircle(
              size: 320,
              color: AppTheme.splashAmbient2.withOpacity(0.2),
              blur: 80,
            ),
          ),

          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
              child: Column(
                children: [
                  // Progress Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 48,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppTheme.splashPrimary.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 24,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppTheme.outlineVariant.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 24,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppTheme.outlineVariant.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),

                  // Card Stack Illustration
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Back Card: Product Context
                        Positioned(
                          left: 16,
                          top: 0,
                          child: Transform.rotate(
                            angle: -0.1, // -6 degrees approx
                            child: _OnboardingCard(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Stack(
                                children: [
                                  // Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/onboarding_1.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // Overlay
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          color: Colors.white.withOpacity(0.6),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'SCANNING INGREDIENTS',
                                                style: GoogleFonts.inter(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.5,
                                                  color: AppTheme.splashOnSurfaceVariant.withOpacity(0.8),
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              // Pulsing Progress bar
                                              AnimatedBuilder(
                                                animation: _pulseController,
                                                builder: (context, child) {
                                                  return Container(
                                                    height: 4,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: AppTheme.splashPrimary.withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(2),
                                                    ),
                                                    child: FractionallySizedBox(
                                                      alignment: Alignment.centerLeft,
                                                      widthFactor: 0.4 + (_pulseController.value * 0.3),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: AppTheme.splashPrimary,
                                                          borderRadius: BorderRadius.circular(2),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Front Card: Ingredient Result
                        Positioned(
                          right: 16,
                          bottom: 0,
                          child: Transform.rotate(
                            angle: 0.1, // 6 degrees approx
                            child: _OnboardingCard(
                              width: MediaQuery.of(context).size.width * 0.55,
                              height: 240,
                              borderColor: AppTheme.splashPrimary.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 56,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        color: AppTheme.splashAmbient1,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Icon(
                                        Icons.auto_awesome,
                                        color: AppTheme.splashPrimary,
                                        size: 28,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'SAFETY RATING',
                                      style: GoogleFonts.inter(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        color: AppTheme.splashOnSurfaceVariant.withOpacity(0.8),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Clean',
                                      style: GoogleFonts.manrope(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        color: AppTheme.splashPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    // Dummy lines
                                    Column(
                                      children: List.generate(3, (index) => Padding(
                                        padding: const EdgeInsets.only(bottom: 6.0),
                                        child: Container(
                                          height: 4,
                                          width: 80 - (index * 15.0),
                                          decoration: BoxDecoration(
                                            color: AppTheme.outlineVariant.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(2),
                                          ),
                                        ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Center Connection Icon
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme.splashGradientStart, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 40,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.flare,
                            color: AppTheme.splashPrimary,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Headline & Body
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Text(
                          'Understand your skincare instantly',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.manrope(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.splashPrimary,
                            height: 1.1,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "AI-powered ingredient analysis. Know what's truly inside your products.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: AppTheme.splashOnSurfaceVariant.withOpacity(0.7),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Footer Actions
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const LandingScreen()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFC2B1A4), Color(0xFF92867D)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF92867D).withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: GoogleFonts.manrope(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '98% INGREDIENT MATCH ACCURACY',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: AppTheme.splashPrimary.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Background Texture Overlay (Optional but nice)
          IgnorePointer(
            child: Opacity(
              opacity: 0.03,
              child: Image.network(
                'https://www.transparenttextures.com/patterns/natural-paper.png',
                repeat: ImageRepeat.repeat,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingCard extends StatelessWidget {
  final double width;
  final double? height;
  final Widget child;
  final Color? borderColor;

  const _OnboardingCard({
    required this.width,
    this.height,
    required this.child,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? width * 1.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        boxShadow: [
          BoxShadow(
            color: AppTheme.splashPrimary.withOpacity(0.12),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _BlurredCircle extends StatelessWidget {
  final double size;
  final Color color;
  final double blur;

  const _BlurredCircle({
    required this.size,
    required this.color,
    required this.blur,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(color: Colors.transparent),
      ),
    );
  }
}
