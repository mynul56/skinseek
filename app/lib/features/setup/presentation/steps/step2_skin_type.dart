import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/setup_provider.dart';
import '../../data/models/skin_profile.dart';
import '../widgets/setup_widgets.dart';

class Step2SkinType extends ConsumerWidget {
  const Step2SkinType({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(setupNotifierProvider).profile;

    final options = [
      _SkinOption(
        type: SkinType.dry,
        title: 'Dry',
        desc: 'Feels tight, shows fine lines, or has flaky patches.',
        icon: Icons.water_drop_outlined,
        color: const Color(0xFFF5E6DA),
      ),
      _SkinOption(
        type: SkinType.oily,
        title: 'Oily',
        desc: 'Visible pores and persistent shine throughout the day.',
        icon: Icons.opacity_outlined,
        color: const Color(0xFFFDD4C0),
      ),
      _SkinOption(
        type: SkinType.combination,
        title: 'Combination',
        desc: 'Oily in the T-zone and dry or normal on cheeks.',
        icon: Icons.balance_outlined,
        color: const Color(0xFF675D53),
        isFeatured: true,
        badge: 'Most Common',
      ),
      _SkinOption(
        type: SkinType.normal,
        title: 'Normal',
        desc: 'Balanced moisture levels with few imperfections.',
        icon: Icons.face_outlined,
        color: const Color(0xFFE9E8E5),
      ),
      _SkinOption(
        type: SkinType.sensitive,
        title: 'Sensitive',
        desc: 'Easily irritated by products, weather, or touch.',
        icon: Icons.auto_fix_high_outlined,
        color: const Color(0xFFFFDAD6),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StepTitle(
          title: 'What\'s your skin type?',
          subtitle: 'Knowing your skin type helps our AI customize your analysis and recommendations.',
        ),
        const SizedBox(height: 32),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            final opt = options[index];
            return SelectionCard(
              title: opt.title,
              description: opt.desc,
              icon: opt.icon,
              backgroundColor: opt.color,
              isSelected: profile.skinType == opt.type,
              onTap: () => ref.read(setupNotifierProvider.notifier).updateSkinType(opt.type),
            );
          },
        ),
        const SizedBox(height: 16),
        SelectionCard(
          title: options[2].title,
          description: options[2].desc,
          icon: options[2].icon,
          backgroundColor: options[2].color,
          isSelected: profile.skinType == options[2].type,
          isFeatured: true,
          badge: options[2].badge,
          onTap: () => ref.read(setupNotifierProvider.notifier).updateSkinType(options[2].type),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            final opt = options[index + 3];
            return SelectionCard(
              title: opt.title,
              description: opt.desc,
              icon: opt.icon,
              backgroundColor: opt.color,
              isSelected: profile.skinType == opt.type,
              onTap: () => ref.read(setupNotifierProvider.notifier).updateSkinType(opt.type),
            );
          },
        ),
        const SizedBox(height: 120),
      ],
    );
  }
}

class _SkinOption {
  final SkinType type;
  final String title;
  final String desc;
  final IconData icon;
  final Color color;
  final bool isFeatured;
  final String? badge;

  _SkinOption({
    required this.type,
    required this.title,
    required this.desc,
    required this.icon,
    required this.color,
    this.isFeatured = false,
    this.badge,
  });
}
