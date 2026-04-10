import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_result.freezed.dart';
part 'analysis_result.g.dart';

@freezed
class AnalysisResult with _$AnalysisResult {
  const factory AnalysisResult({
    required String summary,
    @JsonKey(name: 'key_actives') @Default([]) List<IngredientInsight> keyActives,
    @JsonKey(name: 'potential_irritants') @Default([]) List<IngredientInsight> potentialIrritants,
    @JsonKey(name: 'comedogenic_rating') required String comedogenicRating,
    required String recommendation,
    @JsonKey(name: 'safety_score') required double safetyScore,
  }) = _AnalysisResult;

  factory AnalysisResult.fromJson(Map<String, dynamic> json) => _$AnalysisResultFromJson(json);
}

@freezed
class IngredientInsight with _$IngredientInsight {
  const factory IngredientInsight({
    required String name,
    String? benefit,
    String? reason,
  }) = _IngredientInsight;

  factory IngredientInsight.fromJson(Map<String, dynamic> json) => _$IngredientInsightFromJson(json);
}
