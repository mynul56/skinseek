import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';
import 'package:skinseek_app/features/home/presentation/screens/home_dashboard_screen.dart';

import '../riverpod/setup_provider.dart';
import '../steps/step1_welcome.dart';
import '../steps/step2_skin_type.dart';
import '../steps/step3_concerns.dart';
import '../steps/step4_goals.dart';
import '../steps/step5_experience.dart';
import '../steps/step6_summary.dart';
import '../widgets/setup_widgets.dart';

class SkinSetupFlow extends ConsumerStatefulWidget {
  const SkinSetupFlow({super.key});

  @override
  ConsumerState<SkinSetupFlow> createState() => _SkinSetupFlowState();
}

class _SkinSetupFlowState extends ConsumerState<SkinSetupFlow> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Initialize controller with current step from state
    final currentStep = ref.read(setupNotifierProvider).currentStep;
    _pageController = PageController(initialPage: currentStep);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(setupNotifierProvider);
    final notifier = ref.read(setupNotifierProvider.notifier);

    // Sync PageController if state changes externally (e.g. from Summary page edits)
    if (_pageController.hasClients && _pageController.page?.round() != state.currentStep) {
      _pageController.animateToPage(
        state.currentStep,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.splashGradientStart,
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                // Ambient Background Decorations
                Positioned(
                  top: -100,
                  right: -100,
                  child: BlurredCircle(size: 384, color: AppTheme.splashAmbient1.withOpacity(0.2), blur: 100),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.4,
                  left: -180,
                  child: BlurredCircle(size: 384, color: AppTheme.splashAmbient2.withOpacity(0.1), blur: 120),
                ),

                SafeArea(
                  child: Column(
                    children: [
                      SetupHeader(
                        currentStep: state.currentStep,
                        totalSteps: 6,
                        avatarUrl:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuBTOamVTzbOHO4sVjqD9btNU6u7d2IC77-5Xu7YXz0ucDuxjuSd1UXYxwrU9IdYYqCG33071EWKLteziANkqaa9wZqxCZnred6e0GLqaC6Tc1A8hfYYN7BKQEvRSlB2wSgteqkyB1Sbd1FfXIGbX65UnHhdoeXvWycfa9-m9M0WNxpJXZRKrRm6ESZMCS5rajyGhLsBSPpKYFMIS1Sb8KVf69YsfwIwTwhMRiGYYEGMP3DsoOZ6Z8_CH1DEaul-gK92pWAztz-8sh07',
                      ),
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(), // Controlled via buttons
                          children: const [
                            SingleChildScrollView(padding: EdgeInsets.all(24), child: Step1Welcome()),
                            SingleChildScrollView(padding: EdgeInsets.all(24), child: Step2SkinType()),
                            SingleChildScrollView(padding: EdgeInsets.all(24), child: Step3Concerns()),
                            SingleChildScrollView(padding: EdgeInsets.all(24), child: Step4Goals()),
                            SingleChildScrollView(padding: EdgeInsets.all(24), child: Step5Experience()),
                            SingleChildScrollView(padding: EdgeInsets.all(24), child: Step6Summary()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom Navigation
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SetupBottomBar(
                    showBack: state.currentStep > 0,
                    onBack: () => notifier.previousStep(),
                    onContinue: () async {
                      if (state.currentStep == 5) {
                        await notifier.completeSetup();
                        if (mounted) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const HomeDashboardScreen()),
                            (route) => false,
                          );
                        }
                      } else {
                        notifier.nextStep();
                      }
                    },
                    isContinueEnabled: notifier.isStepValid(state.currentStep),
                    continueLabel: state.currentStep == 5 ? 'Start Exploring' : 'Continue',
                  ),
                ),

                // Paper Texture
                IgnorePointer(
                  child: Opacity(
                    opacity: 0.1,
                    child: Image.network(
                      'https://www.transparenttextures.com/patterns/natural-paper.png',
                      repeat: ImageRepeat.repeat,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
