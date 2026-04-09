import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';
import 'package:skinseek_app/features/auth/presentation/screens/register_screen.dart';
import 'package:skinseek_app/features/auth/presentation/screens/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
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
          // Decorative Ambient Background Elements
          Positioned(
            top: -100,
            left: -50,
            child: _BlurredCircle(
              size: 256,
              color: AppTheme.splashAmbient1.withOpacity(0.3),
              blur: 80,
            ),
          ),
          Positioned(
            bottom: -80,
            right: -80,
            child: _BlurredCircle(
              size: 320,
              color: AppTheme.splashAmbient2.withOpacity(0.2),
              blur: 80,
            ),
          ),

          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Custom Header
                  SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SkinSeek',
                          style: GoogleFonts.manrope(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -1,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const Icon(
                          Icons.auto_awesome,
                          color: AppTheme.splashPrimary,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Hero Section
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.manrope(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -1,
                            color: AppTheme.splashOnSurfaceVariant,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Return to your digital sanctuary.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: AppTheme.splashOnSurfaceVariant.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Login Form
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Address
                      _LoginFormLabel(label: 'Email Address'),
                      const SizedBox(height: 8),
                      _LoginFormInput(
                        controller: _emailController,
                        hint: 'your@email.com',
                        keyboardType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 24),

                      // Password
                      _LoginFormLabel(label: 'Password'),
                      const SizedBox(height: 8),
                      _LoginFormInput(
                        controller: _passwordController,
                        hint: '••••••••',
                        obscureText: true,
                      ),

                      const SizedBox(height: 16),

                      // Forgot Password Link
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.splashPrimary,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Login Button
                      GestureDetector(
                        onTap: () {
                          // Handle Login
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFF5E6DA), Color(0xFFD2C4B9)],
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
                              'Login',
                              style: GoogleFonts.manrope(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.splashPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 48),

                  // Social Logins
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppTheme.splashOutlineVariant.withOpacity(0.3),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'OR CONTINUE WITH',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                color: AppTheme.splashOnSurfaceVariant.withOpacity(0.4),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppTheme.splashOutlineVariant.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          _SocialLoginButton(
                            icon: Icons.g_mobiledata_rounded,
                            label: 'Google',
                          ),
                          const SizedBox(width: 16),
                          _SocialLoginButton(
                            icon: Icons.apple_rounded,
                            label: 'Apple',
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 48),

                  // Sign Up Link
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppTheme.splashOnSurfaceVariant.withOpacity(0.6),
                        ),
                        children: [
                          const TextSpan(text: 'New to SkinSeek? '),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                                );
                              },
                              child: Text(
                                'Create an Account',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.splashPrimary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Background Texture Overlay
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

class _LoginFormLabel extends StatelessWidget {
  final String label;

  const _LoginFormLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppTheme.authTertiary,
        ),
      ),
    );
  }
}

class _LoginFormInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;

  const _LoginFormInput({
    required this.controller,
    required this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: GoogleFonts.inter(
        color: AppTheme.splashOnSurfaceVariant,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          color: AppTheme.splashOutlineVariant,
        ),
        filled: true,
        fillColor: AppTheme.authSurfaceContainerHigh,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SocialLoginButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: AppTheme.splashOnSurfaceVariant,
            size: 28,
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
