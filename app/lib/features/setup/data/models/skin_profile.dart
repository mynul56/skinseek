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

String _enumToken(Object value) => value.toString().split('.').last;

String _enumUpper(Object value) {
  final token = _enumToken(value);
  final snake = token.replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (m) => '${m[1]}_${m[2]}');
  return snake.toUpperCase();
}

String _enumTitle(Object value) {
  final upper = _enumUpper(value);
  return upper
      .split('_')
      .map((p) => p.isEmpty ? p : '${p[0]}${p.substring(1).toLowerCase()}')
      .join(' ');
}

extension SkinTypeLabelX on SkinType {
  String get upperLabel => _enumUpper(this);
  String get titleLabel => _enumTitle(this);
}

extension SkinConcernLabelX on SkinConcern {
  String get upperLabel => _enumUpper(this);
  String get titleLabel => _enumTitle(this);
}

extension SkinGoalLabelX on SkinGoal {
  String get upperLabel => _enumUpper(this);
  String get titleLabel => _enumTitle(this);
}

extension ExperienceLevelLabelX on ExperienceLevel {
  String get upperLabel => _enumUpper(this);
  String get titleLabel => _enumTitle(this);
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
