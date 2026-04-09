import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/skin_profile.dart';
import '../../data/repositories/setup_repository.dart';

final setupRepositoryProvider = Provider((ref) => SetupRepository());

class SetupState {
  final int currentStep;
  final SkinProfile profile;
  final bool isLoading;

  SetupState({
    required this.currentStep,
    required this.profile,
    this.isLoading = false,
  });

  SetupState copyWith({
    int? currentStep,
    SkinProfile? profile,
    bool? isLoading,
  }) {
    return SetupState(
      currentStep: currentStep ?? this.currentStep,
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class SkinSetupNotifier extends StateNotifier<SetupState> {
  final SetupRepository _repository;

  SkinSetupNotifier(this._repository)
      : super(SetupState(currentStep: 0, profile: const SkinProfile())) {
    _loadInitialState();
  }

  Future<void> _loadInitialState() async {
    state = state.copyWith(isLoading: true);
    final profile = await _repository.getProfile();
    final step = await _repository.getCurrentStep();
    state = state.copyWith(
      profile: profile ?? const SkinProfile(),
      currentStep: step,
      isLoading: false,
    );
  }

  void updateSkinType(SkinType type) {
    state = state.copyWith(
      profile: state.profile.copyWith(skinType: type),
    );
    _saveState();
  }

  void toggleConcern(SkinConcern concern) {
    final currentConcerns = List<SkinConcern>.from(state.profile.concerns);
    if (currentConcerns.contains(concern)) {
      currentConcerns.remove(concern);
    } else if (currentConcerns.length < 5) {
      currentConcerns.add(concern);
    }
    state = state.copyWith(
      profile: state.profile.copyWith(concerns: currentConcerns),
    );
    _saveState();
  }

  void toggleGoal(SkinGoal goal) {
    final currentGoals = List<SkinGoal>.from(state.profile.goals);
    if (currentGoals.contains(goal)) {
      currentGoals.remove(goal);
    } else if (currentGoals.length < 3) {
      currentGoals.add(goal);
    }
    state = state.copyWith(
      profile: state.profile.copyWith(goals: currentGoals),
    );
    _saveState();
  }

  void updateExperienceLevel(ExperienceLevel level) {
    state = state.copyWith(
      profile: state.profile.copyWith(experienceLevel: level),
    );
    _saveState();
  }

  void nextStep() {
    if (state.currentStep < 5) {
      state = state.copyWith(currentStep: state.currentStep + 1);
      _saveState();
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
      _saveState();
    }
  }

  void goToStep(int step) {
    state = state.copyWith(currentStep: step);
    _saveState();
  }

  Future<void> completeSetup() async {
    final finalProfile = state.profile.copyWith(
      isCompleted: true,
      completedAt: DateTime.now(),
    );
    await _repository.saveProfile(finalProfile);
    state = state.copyWith(profile: finalProfile);
  }

  Future<void> _saveState() async {
    await _repository.saveProfile(state.profile);
    await _repository.saveCurrentStep(state.currentStep);
  }

  Future<void> resetSetup() async {
    await _repository.clearAll();
    state = SetupState(currentStep: 0, profile: const SkinProfile());
  }

  bool isStepValid(int step) {
    switch (step) {
      case 0:
        return true; // Welcome
      case 1:
        return state.profile.skinType != null;
      case 2:
        return state.profile.concerns.isNotEmpty;
      case 3:
        return state.profile.goals.isNotEmpty;
      case 4:
        return state.profile.experienceLevel != null;
      case 5:
        return true; // Summary
      default:
        return false;
    }
  }
}

final setupNotifierProvider =
    StateNotifierProvider<SkinSetupNotifier, SetupState>((ref) {
  final repository = ref.watch(setupRepositoryProvider);
  return SkinSetupNotifier(repository);
});
