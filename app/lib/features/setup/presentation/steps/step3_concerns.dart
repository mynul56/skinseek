import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../riverpod/setup_provider.dart';
import '../../data/models/skin_profile.dart';
import '../widgets/setup_widgets.dart';

class Step3Concerns extends ConsumerWidget {
  const Step3Concerns({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(setupNotifierProvider);
    final selectedCount = state.profile.concerns.length;

    final options = [
      _ConcernOption(SkinConcern.acne, 'Acne', 'Breakouts and blemishes', Icons.error_outline),
      _ConcernOption(SkinConcern.darkSpots, 'Dark Spots', 'Hyperpigmentation', Icons.blur_on),
      _ConcernOption(SkinConcern.redness, 'Redness', 'Irritation and flush', Icons.flare),
      _ConcernOption(SkinConcern.dryness, 'Dryness', 'Flaky or tight skin', Icons.water_drop),
      _ConcernOption(SkinConcern.oiliness, 'Oiliness', 'Excess shine and sebum', Icons.opacity),
      _ConcernOption(SkinConcern.fineLines, 'Fine Lines', 'Early signs of aging', Icons.waves),
      _ConcernOption(SkinConcern.largePores, 'Large Pores', 'Visible pore structure', Icons.lens_blur_rounded),
      _ConcernOption(SkinConcern.dullness, 'Dullness', 'Lack of radiance', Icons.wb_sunny_outlined),
      _ConcernOption(SkinConcern.unevenTexture, 'Texture', 'Bumps or rough skin', Icons.texture),
      _ConcernOption(SkinConcern.sensitivity, 'Sensitivity', 'Reactive to products', Icons.auto_fix_high),
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
                title: 'Main concerns?',
                subtitle: 'Choose what you\'d like us to prioritize.',
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: selectedCount == 5 ? Colors.orange.shade50 : Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$selectedCount / 5',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: selectedCount == 5 ? Colors.orange.shade700 : Colors.blue.shade700,
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
            final isSelected = state.profile.concerns.contains(opt.concern);
            return SelectionCard(
              title: opt.title,
              description: opt.desc,
              icon: opt.icon,
              backgroundColor: const Color(0xFFF5E6DA),
              isSelected: isSelected,
              onTap: () => ref.read(setupNotifierProvider.notifier).toggleConcern(opt.concern),
            );
          },
        ),
        const SizedBox(height: 120),
      ],
    );
  }
}

class _ConcernOption {
  final SkinConcern concern;
  final String title;
  final String desc;
  final IconData icon;

  _ConcernOption(this.concern, this.title, this.desc, this.icon);
}
