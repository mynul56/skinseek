import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinseek_app/features/navigation/presentation/riverpod/navigation_provider.dart';

class DashboardBottomNav extends ConsumerWidget {
  const DashboardBottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);

    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(color: const Color(0xFF675D53).withOpacity(0.08), blurRadius: 40, offset: const Offset(0, 20)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavIcon(
                icon: Icons.home_filled,
                isSelected: currentIndex == 0,
                onTap: () => ref.read(navigationIndexProvider.notifier).state = 0,
              ),
              _NavIcon(
                icon: Icons.flare,
                isSelected: currentIndex == 1,
                onTap: () => ref.read(navigationIndexProvider.notifier).state = 1,
              ),
              _NavIcon(
                icon: Icons.auto_fix_high,
                isSelected: currentIndex == 2,
                onTap: () => ref.read(navigationIndexProvider.notifier).state = 2,
              ),
              _NavIcon(
                icon: Icons.person,
                isSelected: currentIndex == 3,
                onTap: () => ref.read(navigationIndexProvider.notifier).state = 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavIcon({required this.icon, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: isSelected
            ? const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFF5E6DA), Color(0xFF675D53)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [BoxShadow(color: Color(0xFF675D53), blurRadius: 12, offset: Offset(0, 4), spreadRadius: -2)],
              )
            : null,
        child: Icon(icon, color: isSelected ? Colors.white : const Color(0xFF675D53).withOpacity(0.4), size: 24),
      ),
    );
  }
}
