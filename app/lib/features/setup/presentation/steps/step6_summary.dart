import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../riverpod/setup_provider.dart';
import '../../data/models/skin_profile.dart';
import '../widgets/setup_widgets.dart';

class Step6Summary extends ConsumerWidget {
  const Step6Summary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(setupNotifierProvider).profile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StepTitle(
          title: 'You\'re all set',
          subtitle: 'Here\'s your skin profile. You can change this anytime from Profile.',
        ),
        const SizedBox(height: 32),
        _SummarySection(
          title: 'Skin Type',
          value: profile.skinType?.name.toUpperCase() ?? 'NOT SELECTED',
          onEdit: () => ref.read(setupNotifierProvider.notifier).goToStep(1),
        ),
        const SizedBox(height: 16),
        _SummarySection(
          title: 'Main Concerns',
          value: profile.concerns.map((e) => e.name).join(', ').toUpperCase(),
          onEdit: () => ref.read(setupNotifierProvider.notifier).goToStep(2),
        ),
        const SizedBox(height: 16),
        _SummarySection(
          title: 'Skin Goals',
          value: profile.goals.map((e) => e.name).join(', ').toUpperCase(),
          onEdit: () => ref.read(setupNotifierProvider.notifier).goToStep(3),
        ),
        const SizedBox(height: 16),
        _SummarySection(
          title: 'Experience Level',
          value: profile.experienceLevel?.name.toUpperCase() ?? 'NOT SELECTED',
          onEdit: () => ref.read(setupNotifierProvider.notifier).goToStep(4),
        ),
        const SizedBox(height: 40),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF675D53).withOpacity(0.05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFF675D53).withOpacity(0.1)),
          ),
          child: Row(
            children: [
              const Icon(Icons.auto_awesome, color: Color(0xFF675D53)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Our AI is ready to analyze ingredients based on your profile.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF675D53),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 120),
      ],
    );
  }
}

class _SummarySection extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onEdit;

  const _SummarySection({
    required this.title,
    required this.value,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF675D53),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit_outlined, size: 20, color: Color(0xFF675D53)),
          ),
        ],
      ),
    );
  }
}
