// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisResultImpl _$$AnalysisResultImplFromJson(
  Map<String, dynamic> json,
) => _$AnalysisResultImpl(
  summary: json['summary'] as String,
  keyActives:
      (json['key_actives'] as List<dynamic>?)
          ?.map((e) => IngredientInsight.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  potentialIrritants:
      (json['potential_irritants'] as List<dynamic>?)
          ?.map((e) => IngredientInsight.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  comedogenicRating: json['comedogenic_rating'] as String,
  recommendation: json['recommendation'] as String,
  safetyScore: (json['safety_score'] as num).toDouble(),
);

Map<String, dynamic> _$$AnalysisResultImplToJson(
  _$AnalysisResultImpl instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'key_actives': instance.keyActives,
  'potential_irritants': instance.potentialIrritants,
  'comedogenic_rating': instance.comedogenicRating,
  'recommendation': instance.recommendation,
  'safety_score': instance.safetyScore,
};

_$IngredientInsightImpl _$$IngredientInsightImplFromJson(
  Map<String, dynamic> json,
) => _$IngredientInsightImpl(
  name: json['name'] as String,
  benefit: json['benefit'] as String?,
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$$IngredientInsightImplToJson(
  _$IngredientInsightImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'benefit': instance.benefit,
  'reason': instance.reason,
};
