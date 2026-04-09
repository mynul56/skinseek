import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../riverpod/setup_provider.dart';
import '../../data/models/skin_profile.dart';
import '../widgets/setup_widgets.dart';

class Step4Goals extends ConsumerWidget {
  const Step4Goals({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(setupNotifierProvider);
    final selectedCount = state.profile.goals.length;

    final options = [
      _GoalOption(SkinGoal.clearerSkin, 'Clearer Skin', 'Reduce breakouts', Icons.check_circle_outline),
      _GoalOption(SkinGoal.moreHydration, 'Hydration', 'Plump and dewy', Icons.water_drop_outlined),
      _GoalOption(SkinGoal.brighterGlow, 'Brighter Glow', 'Radiant complexion', Icons.wb_sunny_outlined),
      _GoalOption(SkinGoal.evenTone, 'Even Tone', 'Balanced color', Icons.gradient_outlined),
      _GoalOption(SkinGoal.reduceBreakouts, 'Less Breakouts', 'Targeted control', Icons.remove_circle_outline),
      _GoalOption(SkinGoal.smootherTexture, 'Smooth Texture', 'Silky feel', Icons.texture_outlined),
      _GoalOption(SkinGoal.antiAgingSupport, 'Anti-Aging', 'Vitality and firmness', Icons.favorite_outline),
      _GoalOption(SkinGoal.calmSensitiveSkin, 'Calm Skin', 'Soothing relief', Icons.spa_outlined),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
              child: StepTitle(
                title: 'What are your goals?',
                subtitle: 'Tell us what you want to achieve.',
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: selectedCount == 3 ? Colors.green.shade50 : Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$selectedCount / 3',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: selectedCount == 3 ? Colors.green.shade700 : Colors.blue.shade700,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemCount: options.length,
          itemBuilder: (context, index) {
            final opt = options[index];
            final isSelected = state.profile.goals.contains(opt.goal);
            return SelectionCard(
              title: opt.title,
              description: opt.desc,
              icon: opt.icon,
              backgroundColor: const Color(0xFFF5E6DA),
              isSelected: isSelected,
              onTap: () => ref.read(setupNotifierProvider.notifier).toggleGoal(opt.goal),
            );
          },
        ),
        const SizedBox(height: 120),
      ],
    );
  }
}

class _GoalOption {
  final SkinGoal goal;
  final String title;
  final String desc;
  final IconData icon;

  _GoalOption(this.goal, this.title, this.desc, this.icon);
}
