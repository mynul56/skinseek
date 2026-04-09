// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skin_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkinProfileImpl _$$SkinProfileImplFromJson(Map<String, dynamic> json) =>
    _$SkinProfileImpl(
      skinType: $enumDecodeNullable(_$SkinTypeEnumMap, json['skinType']),
      concerns:
          (json['concerns'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SkinConcernEnumMap, e))
              .toList() ??
          const [],
      goals:
          (json['goals'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SkinGoalEnumMap, e))
              .toList() ??
          const [],
      experienceLevel: $enumDecodeNullable(
        _$ExperienceLevelEnumMap,
        json['experienceLevel'],
      ),
      isCompleted: json['isCompleted'] as bool? ?? false,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$SkinProfileImplToJson(
  _$SkinProfileImpl instance,
) => <String, dynamic>{
  'skinType': _$SkinTypeEnumMap[instance.skinType],
  'concerns': instance.concerns.map((e) => _$SkinConcernEnumMap[e]!).toList(),
  'goals': instance.goals.map((e) => _$SkinGoalEnumMap[e]!).toList(),
  'experienceLevel': _$ExperienceLevelEnumMap[instance.experienceLevel],
  'isCompleted': instance.isCompleted,
  'completedAt': instance.completedAt?.toIso8601String(),
};

const _$SkinTypeEnumMap = {
  SkinType.dry: 'dry',
  SkinType.oily: 'oily',
  SkinType.combination: 'combination',
  SkinType.normal: 'normal',
  SkinType.sensitive: 'sensitive',
};

const _$SkinConcernEnumMap = {
  SkinConcern.acne: 'acne',
  SkinConcern.darkSpots: 'dark_spots',
  SkinConcern.redness: 'redness',
  SkinConcern.dryness: 'dryness',
  SkinConcern.oiliness: 'oiliness',
  SkinConcern.fineLines: 'fine_lines',
  SkinConcern.largePores: 'large_pores',
  SkinConcern.dullness: 'dullness',
  SkinConcern.unevenTexture: 'uneven_texture',
  SkinConcern.sensitivity: 'sensitivity',
};

const _$SkinGoalEnumMap = {
  SkinGoal.clearerSkin: 'clearer_skin',
  SkinGoal.moreHydration: 'more_hydration',
  SkinGoal.brighterGlow: 'brighter_glow',
  SkinGoal.evenTone: 'even_tone',
  SkinGoal.reduceBreakouts: 'reduce_breakouts',
  SkinGoal.smootherTexture: 'smoother_texture',
  SkinGoal.antiAgingSupport: 'anti_aging_support',
  SkinGoal.calmSensitiveSkin: 'calm_sensitive_skin',
};

const _$ExperienceLevelEnumMap = {
  ExperienceLevel.beginner: 'beginner',
  ExperienceLevel.intermediate: 'intermediate',
  ExperienceLevel.advanced: 'advanced',
};
