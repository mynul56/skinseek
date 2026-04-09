import 'package:flutter/material.dart';
import '../widgets/setup_widgets.dart';

class Step1Welcome extends StatelessWidget {
  const Step1Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        const StepTitle(
          title: 'Let\'s personalize your skincare',
          subtitle: 'Answer a few quick questions so SkinSeek can tailor every analysis and recommendation to your skin.',
        ),
        const SizedBox(height: 60),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  gradient: const RadialGradient(
                    colors: [Color(0xFFF5E6DA), Colors.transparent],
                  ),
                  borderRadius: BorderRadius.circular(120),
                ),
              ),
              const Icon(
                Icons.auto_fix_high_rounded,
                size: 120,
                color: Color(0xFF675D53),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text(
          'This only takes about 20 seconds.',
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
