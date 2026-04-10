import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';

class SetupHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const SetupHeader({super.key, required this.currentStep, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    final progress = (currentStep + 1) / totalSteps;

    return Column(
      children: [
        Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(color: const Color(0xFFFAF9F6).withOpacity(0.7)),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  Text(
                    'SkinSeek',
                    style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1,
                      color: AppTheme.splashPrimary,
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.authSurfaceContainerHigh,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: MediaQuery.of(context).size.width * 0.8 * progress,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFFF5E6DA), Color(0xFF675D53)]),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'STEP ${currentStep + 1} OF $totalSteps',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: AppTheme.splashPrimary.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SetupBottomBar extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onContinue;
  final bool isContinueEnabled;
  final String continueLabel;
  final bool showBack;

  const SetupBottomBar({
    super.key,
    required this.onBack,
    required this.onContinue,
    this.isContinueEnabled = true,
    this.continueLabel = 'Continue',
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppTheme.splashGradientStart,
            AppTheme.splashGradientStart.withOpacity(0.9),
            AppTheme.splashGradientStart.withOpacity(0),
          ],
        ),
      ),
      child: Row(
        children: [
          if (showBack)
            TextButton.icon(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back, color: AppTheme.splashPrimary),
              label: Text(
                'Back',
                style: GoogleFonts.manrope(fontWeight: FontWeight.bold, color: AppTheme.splashPrimary, fontSize: 16),
              ),
            ),
          const Spacer(),
          GestureDetector(
            onTap: isContinueEnabled ? onContinue : null,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isContinueEnabled ? 1.0 : 0.5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF5E6DA), Color(0xFF675D53)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: [
                    BoxShadow(color: AppTheme.splashPrimary.withOpacity(0.15), blurRadius: 24, offset: const Offset(0, 8)),
                  ],
                ),
                child: Text(
                  continueLabel,
                  style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isFeatured;
  final String? badge;

  const SelectionCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.backgroundColor,
    required this.isSelected,
    required this.onTap,
    this.isFeatured = false,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppTheme.splashPrimary : Colors.transparent, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isSelected ? 0.08 : 0.04),
              blurRadius: 40,
              offset: const Offset(0, 40),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected ? AppTheme.splashPrimary : backgroundColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: isSelected ? Colors.white : AppTheme.splashPrimary, size: 24),
                ),
                if (isFeatured) const SizedBox(height: 12),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.splashPrimary),
                    ),
                    if (badge != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: const Color(0xFFFFE7A8), borderRadius: BorderRadius.circular(999)),
                        child: Text(
                          badge!,
                          style: GoogleFonts.inter(fontSize: 9, fontWeight: FontWeight.w900, color: const Color(0xFF7F6500)),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppTheme.splashOnSurfaceVariant.withOpacity(0.7),
                    height: 1.3,
                  ),
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: AppTheme.splashPrimary, shape: BoxShape.circle),
                  child: const Icon(Icons.check, color: Colors.white, size: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BlurredCircle extends StatelessWidget {
  final double size;
  final Color color;
  final double blur;

  const BlurredCircle({super.key, required this.size, required this.color, required this.blur});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(color: Colors.transparent),
      ),
    );
  }
}

class StepTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const StepTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.5,
            color: AppTheme.splashPrimary,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: GoogleFonts.inter(fontSize: 16, color: AppTheme.splashOnSurfaceVariant.withOpacity(0.8), height: 1.4),
        ),
      ],
    );
  }
}
