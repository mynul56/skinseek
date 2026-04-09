import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';
import 'package:skinseek_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:skinseek_app/features/auth/presentation/screens/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _shimmerController;
  late Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();

    // Logo shimmer/glow animation
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _logoAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    // Progress line shimmer animation
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Navigate to LandingScreen after delay
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const OnboardingScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.splashGradientStart,
                  AppTheme.splashGradientEnd,
                ],
              ),
            ),
          ),

          // Ambient Background Shapes
          Positioned(
            top: -100,
            left: -100,
            child: _BlurredCircle(
              size: 400,
              color: AppTheme.splashAmbient1.withOpacity(0.2),
              blur: 100,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5 - 250,
            right: -200,
            child: _BlurredCircle(
              size: 500,
              color: AppTheme.splashAmbient2.withOpacity(0.15),
              blur: 120,
            ),
          ),
          Positioned(
            bottom: -150,
            left: MediaQuery.of(context).size.width * 0.25 - 150,
            child: _BlurredCircle(
              size: 300,
              color: Colors.white.withOpacity(0.4),
              blur: 80,
            ),
          ),

          // Overlay Glassmorphism Texture
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.05),
            ),
          ),

          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Icon
                ScaleTransition(
                  scale: _logoAnimation,
                  child: Container(
                    width: 144,
                    height: 144,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.splashPrimary.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.flare,
                        size: 64,
                        color: AppTheme.splashPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                
                // Branding
                Column(
                  children: [
                    Text(
                      'SkinSeek',
                      style: GoogleFonts.manrope(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.splashPrimary,
                        letterSpacing: -2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'EST. 2024',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.splashOnSurfaceVariant.withOpacity(0.6),
                        letterSpacing: 4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bottom Narrative & Progress
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Smart skincare, simplified',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: AppTheme.splashPrimary.withOpacity(0.7),
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Shimmer Progress Line
                Container(
                  width: 96,
                  height: 1,
                  color: AppTheme.splashPrimary.withOpacity(0.1),
                  child: AnimatedBuilder(
                    animation: _shimmerController,
                    builder: (context, child) {
                      return FractionallySizedBox(
                        widthFactor: 1.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: const [
                                Colors.transparent,
                                Color(0x66675D53), // primary/40
                                Colors.transparent,
                              ],
                              stops: [
                                _shimmerController.value - 0.4,
                                _shimmerController.value,
                                _shimmerController.value + 0.4,
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
