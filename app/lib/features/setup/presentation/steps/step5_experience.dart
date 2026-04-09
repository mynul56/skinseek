import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/setup_provider.dart';
import '../../data/models/skin_profile.dart';
import '../widgets/setup_widgets.dart';

class Step5Experience extends ConsumerWidget {
  const Step5Experience({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(setupNotifierProvider).profile;

    final options = [
      _ExpOption(
        level: ExperienceLevel.beginner,
        title: 'Beginner',
        desc: 'I keep things simple and use only a few products.',
        icon: Icons.auto_fix_normal_outlined,
      ),
      _ExpOption(
        level: ExperienceLevel.intermediate,
        title: 'Intermediate',
        desc: 'I follow a routine and know some common ingredients.',
        icon: Icons.science_outlined,
      ),
      _ExpOption(
        level: ExperienceLevel.advanced,
        title: 'Advanced',
        desc: 'I actively use skincare actives and want deeper insights.',
        icon: Icons.biotech_outlined,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StepTitle(
          title: 'Your experience level?',
          subtitle: 'This helps us explain results in a way that suits you.',
        ),
        const SizedBox(height: 32),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: options.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final opt = options[index];
            return SelectionCard(
              title: opt.title,
              description: opt.desc,
              icon: opt.icon,
              backgroundColor: const Color(0xFFF5E6DA),
              isSelected: profile.experienceLevel == opt.level,
              onTap: () => ref.read(setupNotifierProvider.notifier).updateExperienceLevel(opt.level),
            );
          },
        ),
        const SizedBox(height: 120),
      ],
    );
  }
}

class _ExpOption {
  final ExperienceLevel level;
  final String title;
  final String desc;
  final IconData icon;

  _ExpOption({
    required this.level,
    required this.title,
    required this.desc,
    required this.icon,
  });
}
