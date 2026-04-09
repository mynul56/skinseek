import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinseek_app/features/setup/presentation/riverpod/setup_provider.dart';
import '../widgets/home_widgets.dart';

class HomeDashboardScreen extends ConsumerWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Attempt to get user name from registration/setup state
    // For now using the requested name "Mynul" if not found
    final setupState = ref.watch(setupNotifierProvider);
    final userName = setupState.profile.isCompleted ? 'Mynul' : 'Explorer';

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Stack(
        children: [
          // Main Scrollable Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120), // Space for floating nav
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GreetingSection(userName: userName),
                        const SizedBox(height: 32),
                        const ActionBentoGrid(),
                        const SizedBox(height: 48),
                        const RecentScansSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Floating Bottom Navigation
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: DashboardBottomNav(),
          ),
        ],
      ),
    );
  }
}
