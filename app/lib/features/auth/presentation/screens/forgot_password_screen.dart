import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';
import 'package:skinseek_app/features/auth/presentation/screens/reset_password_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _isSuccess = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSendLink() {
    setState(() => _isSuccess = true);
    // Mock for demo: Navigate to Reset Password after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ResetPasswordScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.splashGradientStart,
      body: Stack(
        children: [
          // Background Artistic Elements
          Positioned(
            top: -100,
            right: -100,
            child: _BlurredCircle(size: 256, color: AppTheme.splashAmbient1.withOpacity(0.3), blur: 80),
          ),

          // Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                _RecoveryHeader(onBack: () => Navigator.of(context).pop()),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 48),

                      // Hero Section
                      Text(
                        _isSuccess ? 'Check your Inbox' : 'Reset Your Sanctuary',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1,
                          color: AppTheme.splashOnSurfaceVariant,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _isSuccess
                            ? 'We\'ve sent a recovery link to your email. Please follow the instructions to secure your account.'
                            : 'Enter your email address below to receive a recovery link for your account.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppTheme.splashOnSurfaceVariant.withOpacity(0.7),
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 64),

                      if (!_isSuccess) ...[
                        // Email Input
                        const _RecoveryInputLabel(label: 'Email Address'),
                        const SizedBox(height: 8),
                        _RecoveryInputField(
                          controller: _emailController,
                          hint: 'your@email.com',
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 48),

                        // Action Button
                        GestureDetector(
                          onTap: _handleSendLink,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF5E6DA), Color(0xFFD2C4B9)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(999),
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
                                'Send Link',
                                style: GoogleFonts.manrope(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.splashPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ] else ...[
                        // Success Icon
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(color: AppTheme.splashAmbient1.withOpacity(0.4), shape: BoxShape.circle),
                          child: const Icon(Icons.mark_email_read_rounded, color: AppTheme.splashPrimary, size: 40),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Paper Texture
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

class _RecoveryHeader extends StatelessWidget {
  final VoidCallback onBack;

  const _RecoveryHeader({required this.onBack});

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

class _RecoveryInputLabel extends StatelessWidget {
  final String label;

  const _RecoveryInputLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          label.toUpperCase(),
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: AppTheme.authTertiary,
          ),
        ),
      ),
    );
  }
}

class _RecoveryInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;

  const _RecoveryInputField({required this.controller, required this.hint, this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppTheme.authSurfaceContainerHigh, borderRadius: BorderRadius.circular(16)),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: GoogleFonts.inter(color: AppTheme.splashOnSurfaceVariant, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.inter(color: Colors.grey.shade400, fontWeight: FontWeight.w500),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
