import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.splashGradientStart,
      body: Stack(
        children: [
          // Background Artistic Elements
          Positioned(
            top: -120,
            right: -120,
            child: _BlurredCircle(size: 384, color: AppTheme.splashAmbient1.withOpacity(0.3), blur: 100),
          ),
          Positioned(
            bottom: -120,
            left: -120,
            child: _BlurredCircle(size: 320, color: AppTheme.splashAmbient2.withOpacity(0.2), blur: 80),
          ),

          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Header
                _RegisterHeader(onBack: () => Navigator.of(context).pop()),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Hero Section
                        const SizedBox(height: 16),
                        Text(
                          'Create your Sanctuary',
                          style: GoogleFonts.manrope(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -1,
                            color: AppTheme.splashOnSurfaceVariant,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Join our community of mindful skincare.',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: AppTheme.splashOnSurfaceVariant.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Form
                        const _RegisterFormLabel(label: 'Full Name'),
                        _RegisterFormInput(controller: _nameController, hint: 'Julianne Vellum'),
                        const SizedBox(height: 24),

                        const _RegisterFormLabel(label: 'Email Address'),
                        _RegisterFormInput(
                          controller: _emailController,
                          hint: 'hello@sanctuary.com',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 24),

                        const _RegisterFormLabel(label: 'Password'),
                        _RegisterFormInput(controller: _passwordController, hint: '••••••••••••', obscureText: true),

                        const SizedBox(height: 24),

                        // Terms Checkbox
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: _agreeToTerms,
                                onChanged: (val) => setState(() => _agreeToTerms = val ?? false),
                                activeColor: AppTheme.splashPrimary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                side: BorderSide(color: AppTheme.splashOutlineVariant.withOpacity(0.5)),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: AppTheme.splashOnSurfaceVariant.withOpacity(0.8),
                                    height: 1.3,
                                  ),
                                  children: [
                                    const TextSpan(text: 'I agree to the '),
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: GoogleFonts.inter(
                                        color: AppTheme.splashPrimary,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppTheme.splashPrimary.withOpacity(0.3),
                                      ),
                                    ),
                                    const TextSpan(text: ' and '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: GoogleFonts.inter(
                                        color: AppTheme.splashPrimary,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppTheme.splashPrimary.withOpacity(0.3),
                                      ),
                                    ),
                                    const TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        // Create Account Button
                        GestureDetector(
                          onTap: () {
                            // Handle Registration
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF5E6DA), Color(0xFF675D53)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(double.infinity),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.splashPrimary.withOpacity(0.15),
                                  blurRadius: 24,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Create Account',
                                style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        // Divider
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(child: Divider(color: AppTheme.splashOutlineVariant.withOpacity(0.2))),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'OR CONTINUE WITH',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: AppTheme.splashOutlineVariant.withOpacity(0.2))),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Social Grid
                        const Row(
                          children: [
                            _SocialGridButton(icon: Icons.g_mobiledata_rounded, label: 'Google'),
                            SizedBox(width: 16),
                            _SocialGridButton(icon: Icons.apple_rounded, label: 'Apple'),
                          ],
                        ),

                        const SizedBox(height: 32),

                        // Login Footer Link
                        Center(
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: AppTheme.splashOnSurfaceVariant.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                const TextSpan(text: 'Already part of the sanctuary? '),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Text(
                                      'Login',
                                      style: GoogleFonts.inter(fontWeight: FontWeight.w900, color: AppTheme.splashPrimary),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Fine Print Footer
                        Text(
                          'SKINSEEK AI © 2024 • GUIDED BY LUXURY',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Paper Texture Overlay
          IgnorePointer(
            child: Opacity(
              opacity: 0.1,
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

class _RegisterHeader extends StatelessWidget {
  final VoidCallback onBack;

  const _RegisterHeader({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back, color: Color(0xFF4D4D4D)),
          ),
          const SizedBox(width: 8),
          Text(
            'SkinSeek',
            style: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
              color: const Color(0xFF2D2D2D),
            ),
          ),
        ],
      ),
    );
  }
}

class _RegisterFormLabel extends StatelessWidget {
  final String label;

  const _RegisterFormLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
          color: AppTheme.authTertiary,
        ),
      ),
    );
  }
}

class _RegisterFormInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;

  const _RegisterFormInput({
    required this.controller,
    required this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppTheme.authSurfaceContainerHigh, borderRadius: BorderRadius.circular(8)),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: GoogleFonts.inter(color: AppTheme.splashOnSurfaceVariant, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.inter(color: Colors.grey.shade400, fontWeight: FontWeight.w500),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}

class _SocialGridButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SocialGridButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(double.infinity),
            border: Border.all(color: AppTheme.splashOutlineVariant.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: AppTheme.splashOnSurfaceVariant),
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.splashOnSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlurredCircle extends StatelessWidget {
  final double size;
  final Color color;
  final double blur;

  const _BlurredCircle({required this.size, required this.color, required this.blur});

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
