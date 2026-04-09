import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.splashGradientStart,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Home Dashboard',
                style: GoogleFonts.manrope(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.splashPrimary,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Setup complete. Your personalized dashboard goes here.',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppTheme.splashOnSurfaceVariant.withOpacity(0.8),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
