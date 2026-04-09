import 'package:freezed_annotation/freezed_annotation.dart';

part 'skin_profile.freezed.dart';
part 'skin_profile.g.dart';

enum SkinType {
  @JsonValue('dry')
  dry,
  @JsonValue('oily')
  oily,
  @JsonValue('combination')
  combination,
  @JsonValue('normal')
  normal,
  @JsonValue('sensitive')
  sensitive,
}

enum SkinConcern {
  @JsonValue('acne')
  acne,
  @JsonValue('dark_spots')
  darkSpots,
  @JsonValue('redness')
  redness,
  @JsonValue('dryness')
  dryness,
  @JsonValue('oiliness')
  oiliness,
  @JsonValue('fine_lines')
  fineLines,
  @JsonValue('large_pores')
  largePores,
  @JsonValue('dullness')
  dullness,
  @JsonValue('uneven_texture')
  unevenTexture,
  @JsonValue('sensitivity')
  sensitivity,
}

enum SkinGoal {
  @JsonValue('clearer_skin')
  clearerSkin,
  @JsonValue('more_hydration')
  moreHydration,
  @JsonValue('brighter_glow')
  brighterGlow,
  @JsonValue('even_tone')
  evenTone,
  @JsonValue('reduce_breakouts')
  reduceBreakouts,
  @JsonValue('smoother_texture')
  smootherTexture,
  @JsonValue('anti_aging_support')
  antiAgingSupport,
  @JsonValue('calm_sensitive_skin')
  calmSensitiveSkin,
}

enum ExperienceLevel {
  @JsonValue('beginner')
  beginner,
  @JsonValue('intermediate')
  intermediate,
  @JsonValue('advanced')
  advanced,
}

@freezed
class SkinProfile with _$SkinProfile {
  const factory SkinProfile({
    SkinType? skinType,
    @Default([]) List<SkinConcern> concerns,
    @Default([]) List<SkinGoal> goals,
    ExperienceLevel? experienceLevel,
    @Default(false) bool isCompleted,
    DateTime? completedAt,
  }) = _SkinProfile;

  factory SkinProfile.fromJson(Map<String, dynamic> json) =>
      _$SkinProfileFromJson(json);
}
