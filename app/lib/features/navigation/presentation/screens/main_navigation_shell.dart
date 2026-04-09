import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinseek_app/features/home/presentation/screens/home_dashboard_screen.dart';
import 'package:skinseek_app/features/barcode/presentation/screens/scanner_screen.dart';
import 'package:skinseek_app/features/navigation/presentation/riverpod/navigation_provider.dart';
import 'package:skinseek_app/features/navigation/presentation/widgets/bottom_nav_bar.dart';
import 'package:skinseek_app/features/profile/presentation/screens/profile_screen.dart';

class MainNavigationShell extends ConsumerWidget {
  const MainNavigationShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);

    final List<Widget> screens = [
      const HomeDashboardScreen(),
      const _PlaceholderScreen(title: 'Explore'),
      const AdvancedScannerScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Stack(
        children: [
          // Current Screen Content
          screens[currentIndex],

          // Floating Bottom Navigation
          const Positioned(bottom: 0, left: 0, right: 0, child: DashboardBottomNav()),
        ],
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}
