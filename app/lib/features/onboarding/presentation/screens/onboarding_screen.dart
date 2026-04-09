import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';
import 'package:skinseek_app/features/auth/presentation/screens/landing_screen.dart';

class OnboardingContent {
  final String title;
  final String body;
  final String backCardImage;
  final String backCardLabel;
  final String backCardTitle;
  final String? frontCardImage;
  final String frontCardLabel;
  final String? frontCardTitle;
  final IconData? centerIcon;
  final Color? centerIconColor;
  final bool showPulse;
  final bool showWarningBanner;
  final bool showCheckmarkBanner;
  final String? bannerTitle;

  const OnboardingContent({
    required this.title,
    required this.body,
    required this.backCardImage,
    required this.backCardLabel,
    required this.backCardTitle,
    this.frontCardImage,
    required this.frontCardLabel,
    this.frontCardTitle,
    this.centerIcon,
    this.centerIconColor,
    this.showPulse = false,
    this.showWarningBanner = false,
    this.showCheckmarkBanner = false,
    this.bannerTitle,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _pulseController;
  int _currentPage = 0;

  final List<OnboardingContent> _pages = [
    const OnboardingContent(
      title: 'Understand your skincare instantly',
      body: "AI-powered ingredient analysis. Know what's truly inside your products.",
      backCardImage: 'assets/images/onboarding_1.png',
      backCardLabel: 'SCANNING INGREDIENTS',
      backCardTitle: '',
      frontCardLabel: 'SAFETY RATING',
      frontCardTitle: 'Clean',
      centerIcon: Icons.flare,
      showPulse: true,
    ),
    const OnboardingContent(
      title: 'Avoid harmful ingredient combinations',
      body: "No more guessing what works for your skin. Keep it safe with our smart Routine Clash Checker.",
      backCardImage: 'assets/images/onboarding_2_back.png',
      backCardLabel: 'Active Ingredient',
      backCardTitle: 'Retinol',
      frontCardImage: 'assets/images/onboarding_2_front.png',
      frontCardLabel: 'Active Ingredient',
      frontCardTitle: 'AHA Acids',
      centerIcon: Icons.error,
      centerIconColor: AppTheme.splashError,
      showWarningBanner: true,
      bannerTitle: 'AHA Acids',
    ),
    const OnboardingContent(
      title: 'Save money with smart dupes',
      body: "Find high-end performance without the high-end price tag.",
      backCardImage: 'assets/images/onboarding_3_back.png',
      backCardLabel: 'Luxury Classic',
      backCardTitle: '\$185.00',
      frontCardImage: 'assets/images/onboarding_3_front.png',
      frontCardLabel: 'Smart Dupe',
      frontCardTitle: '\$24.00',
      centerIcon: Icons.flare,
      showCheckmarkBanner: true,
      bannerTitle: 'Smart Dupe',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LandingScreen()),
      );
    }
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
            child: Column(
              children: [
                const SizedBox(height: 48),
                // Progress Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (index) {
                    final bool isActive = index == _currentPage;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: isActive ? 48 : 24,
                      height: 6,
                      decoration: BoxDecoration(
                        color: isActive 
                          ? AppTheme.splashPrimary.withOpacity(0.4)
                          : AppTheme.splashOutlineVariant.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
                
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return _OnboardingPageView(
                        content: _pages[index],
                        pulseAnimation: _pulseController,
                      );
                    },
                  ),
                ),

                // Footer Actions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _onNextPressed,
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
                              _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
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
                const SizedBox(height: 32),
              ],
            ),
          ),
          
          // Background Texture Overlay
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

class _OnboardingPageView extends StatelessWidget {
  final OnboardingContent content;
  final Animation<double> pulseAnimation;

  const _OnboardingPageView({
    required this.content,
    required this.pulseAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Spacer(),
          // Card Stack Illustration
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Back Card
                Positioned(
                  left: 16,
                  top: 0,
                  child: Transform.rotate(
                    angle: -0.1,
                    child: _OnboardingCard(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              content.backCardImage,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
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
                                        content.backCardLabel,
                                        style: GoogleFonts.inter(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          color: AppTheme.splashOnSurfaceVariant.withOpacity(0.8),
                                        ),
                                      ),
                                      if (content.backCardTitle.isNotEmpty) ...[
                                        const SizedBox(height: 2),
                                        Text(
                                          content.backCardTitle,
                                          style: GoogleFonts.manrope(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                            color: AppTheme.splashPrimary,
                                          ),
                                        ),
                                      ],
                                      if (content.showPulse) ...[
                                        const SizedBox(height: 6),
                                        AnimatedBuilder(
                                          animation: pulseAnimation,
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
                                                widthFactor: 0.4 + (pulseAnimation.value * 0.3),
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

                // Front Card
                Positioned(
                  right: 16,
                  bottom: 0,
                  child: Transform.rotate(
                    angle: 0.1,
                    child: _OnboardingCard(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: 240,
                      borderColor: AppTheme.splashPrimary.withOpacity(0.1),
                      child: Stack(
                        children: [
                          if (content.frontCardImage != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                content.frontCardImage!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (content.showWarningBanner || content.showCheckmarkBanner)
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    color: content.showWarningBanner 
                                      ? AppTheme.splashErrorContainer.withOpacity(0.9)
                                      : AppTheme.splashAmbient1.withOpacity(0.9),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              content.frontCardLabel,
                                              style: GoogleFonts.inter(
                                                fontSize: 8,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                                color: content.showWarningBanner 
                                                  ? AppTheme.splashError.withOpacity(0.8)
                                                  : AppTheme.splashPrimary.withOpacity(0.8),
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              content.bannerTitle!,
                                              style: GoogleFonts.manrope(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                                color: content.showWarningBanner 
                                                  ? AppTheme.splashError
                                                  : AppTheme.splashPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: content.showWarningBanner 
                                              ? AppTheme.splashError.withOpacity(0.1)
                                              : AppTheme.splashPrimary.withOpacity(0.1),
                                            shape: BoxShape.circle,
                                            border: Border.all(color: content.showWarningBanner 
                                              ? AppTheme.splashError.withOpacity(0.2)
                                              : AppTheme.splashPrimary.withOpacity(0.2)),
                                          ),
                                          child: Icon(
                                            content.showWarningBanner 
                                              ? Icons.warning_amber_rounded
                                              : Icons.check_circle_outline_rounded,
                                            color: content.showWarningBanner 
                                              ? AppTheme.splashError
                                              : AppTheme.splashPrimary,
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else
                            Padding(
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
                                    content.frontCardLabel,
                                    style: GoogleFonts.inter(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      color: AppTheme.splashOnSurfaceVariant.withOpacity(0.8),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    content.frontCardTitle ?? '',
                                    style: GoogleFonts.manrope(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w800,
                                      color: AppTheme.splashPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Column(
                                    children: List.generate(3, (index) => Padding(
                                      padding: const EdgeInsets.only(bottom: 6.0),
                                      child: Container(
                                        height: 4,
                                        width: 80 - (index * 15.0),
                                        decoration: BoxDecoration(
                                          color: AppTheme.splashOutlineVariant.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Center Icon
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
                  child: Icon(
                    content.centerIcon ?? Icons.flare,
                    color: content.centerIconColor ?? AppTheme.splashPrimary,
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
                  content.title,
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
                  content.body,
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
          const Spacer(),
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
