import 'package:flutter/material.dart';
import 'package:skinseek_app/features/auth/presentation/screens/login_screen.dart';
import 'package:skinseek_app/features/analyzer/presentation/screens/analyses_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Logo
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 180,
                ),
              ),
              const SizedBox(height: 40),
              // Tagline
              Text(
                'Understand your skin like never before.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'AI-powered ingredient analysis for a healthier, more consistent routine.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const Spacer(),
              // Actions
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnalysesScreen(),
                    ),
                  );
                },
                child: const Text('Get Started'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Already have an account? Log in',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
