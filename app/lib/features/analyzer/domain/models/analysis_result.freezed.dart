// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnalysisResult _$AnalysisResultFromJson(Map<String, dynamic> json) {
  return _AnalysisResult.fromJson(json);
}

/// @nodoc
mixin _$AnalysisResult {
  String get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'key_actives')
  List<IngredientInsight> get keyActives => throw _privateConstructorUsedError;
  @JsonKey(name: 'potential_irritants')
  List<IngredientInsight> get potentialIrritants =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'comedogenic_rating')
  String get comedogenicRating => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  @JsonKey(name: 'safety_score')
  double get safetyScore => throw _privateConstructorUsedError;

  /// Serializes this AnalysisResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisResultCopyWith<AnalysisResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisResultCopyWith<$Res> {
  factory $AnalysisResultCopyWith(
    AnalysisResult value,
    $Res Function(AnalysisResult) then,
  ) = _$AnalysisResultCopyWithImpl<$Res, AnalysisResult>;
  @useResult
  $Res call({
    String summary,
    @JsonKey(name: 'key_actives') List<IngredientInsight> keyActives,
    @JsonKey(name: 'potential_irritants')
    List<IngredientInsight> potentialIrritants,
    @JsonKey(name: 'comedogenic_rating') String comedogenicRating,
    String recommendation,
    @JsonKey(name: 'safety_score') double safetyScore,
  });
}

/// @nodoc
class _$AnalysisResultCopyWithImpl<$Res, $Val extends AnalysisResult>
    implements $AnalysisResultCopyWith<$Res> {
  _$AnalysisResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? keyActives = null,
    Object? potentialIrritants = null,
    Object? comedogenicRating = null,
    Object? recommendation = null,
    Object? safetyScore = null,
  }) {
    return _then(
      _value.copyWith(
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
            keyActives: null == keyActives
                ? _value.keyActives
                : keyActives // ignore: cast_nullable_to_non_nullable
                      as List<IngredientInsight>,
            potentialIrritants: null == potentialIrritants
                ? _value.potentialIrritants
                : potentialIrritants // ignore: cast_nullable_to_non_nullable
                      as List<IngredientInsight>,
            comedogenicRating: null == comedogenicRating
                ? _value.comedogenicRating
                : comedogenicRating // ignore: cast_nullable_to_non_nullable
                      as String,
            recommendation: null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                      as String,
            safetyScore: null == safetyScore
                ? _value.safetyScore
                : safetyScore // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalysisResultImplCopyWith<$Res>
    implements $AnalysisResultCopyWith<$Res> {
  factory _$$AnalysisResultImplCopyWith(
    _$AnalysisResultImpl value,
    $Res Function(_$AnalysisResultImpl) then,
  ) = __$$AnalysisResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String summary,
    @JsonKey(name: 'key_actives') List<IngredientInsight> keyActives,
    @JsonKey(name: 'potential_irritants')
    List<IngredientInsight> potentialIrritants,
    @JsonKey(name: 'comedogenic_rating') String comedogenicRating,
    String recommendation,
    @JsonKey(name: 'safety_score') double safetyScore,
  });
}

/// @nodoc
class __$$AnalysisResultImplCopyWithImpl<$Res>
    extends _$AnalysisResultCopyWithImpl<$Res, _$AnalysisResultImpl>
    implements _$$AnalysisResultImplCopyWith<$Res> {
  __$$AnalysisResultImplCopyWithImpl(
    _$AnalysisResultImpl _value,
    $Res Function(_$AnalysisResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? keyActives = null,
    Object? potentialIrritants = null,
    Object? comedogenicRating = null,
    Object? recommendation = null,
    Object? safetyScore = null,
  }) {
    return _then(
      _$AnalysisResultImpl(
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
        keyActives: null == keyActives
            ? _value._keyActives
            : keyActives // ignore: cast_nullable_to_non_nullable
                  as List<IngredientInsight>,
        potentialIrritants: null == potentialIrritants
            ? _value._potentialIrritants
            : potentialIrritants // ignore: cast_nullable_to_non_nullable
                  as List<IngredientInsight>,
        comedogenicRating: null == comedogenicRating
            ? _value.comedogenicRating
            : comedogenicRating // ignore: cast_nullable_to_non_nullable
                  as String,
        recommendation: null == recommendation
            ? _value.recommendation
            : recommendation // ignore: cast_nullable_to_non_nullable
                  as String,
        safetyScore: null == safetyScore
            ? _value.safetyScore
            : safetyScore // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalysisResultImpl implements _AnalysisResult {
  const _$AnalysisResultImpl({
    required this.summary,
    @JsonKey(name: 'key_actives')
    final List<IngredientInsight> keyActives = const [],
    @JsonKey(name: 'potential_irritants')
    final List<IngredientInsight> potentialIrritants = const [],
    @JsonKey(name: 'comedogenic_rating') required this.comedogenicRating,
    required this.recommendation,
    @JsonKey(name: 'safety_score') required this.safetyScore,
  }) : _keyActives = keyActives,
       _potentialIrritants = potentialIrritants;

  factory _$AnalysisResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisResultImplFromJson(json);

  @override
  final String summary;
  final List<IngredientInsight> _keyActives;
  @override
  @JsonKey(name: 'key_actives')
  List<IngredientInsight> get keyActives {
    if (_keyActives is EqualUnmodifiableListView) return _keyActives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyActives);
  }

  final List<IngredientInsight> _potentialIrritants;
  @override
  @JsonKey(name: 'potential_irritants')
  List<IngredientInsight> get potentialIrritants {
    if (_potentialIrritants is EqualUnmodifiableListView)
      return _potentialIrritants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_potentialIrritants);
  }

  @override
  @JsonKey(name: 'comedogenic_rating')
  final String comedogenicRating;
  @override
  final String recommendation;
  @override
  @JsonKey(name: 'safety_score')
  final double safetyScore;

  @override
  String toString() {
    return 'AnalysisResult(summary: $summary, keyActives: $keyActives, potentialIrritants: $potentialIrritants, comedogenicRating: $comedogenicRating, recommendation: $recommendation, safetyScore: $safetyScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisResultImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(
              other._keyActives,
              _keyActives,
            ) &&
            const DeepCollectionEquality().equals(
              other._potentialIrritants,
              _potentialIrritants,
            ) &&
            (identical(other.comedogenicRating, comedogenicRating) ||
                other.comedogenicRating == comedogenicRating) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.safetyScore, safetyScore) ||
                other.safetyScore == safetyScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    const DeepCollectionEquality().hash(_keyActives),
    const DeepCollectionEquality().hash(_potentialIrritants),
    comedogenicRating,
    recommendation,
    safetyScore,
  );

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisResultImplCopyWith<_$AnalysisResultImpl> get copyWith =>
      __$$AnalysisResultImplCopyWithImpl<_$AnalysisResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisResultImplToJson(this);
  }
}

abstract class _AnalysisResult implements AnalysisResult {
  const factory _AnalysisResult({
    required final String summary,
    @JsonKey(name: 'key_actives') final List<IngredientInsight> keyActives,
    @JsonKey(name: 'potential_irritants')
    final List<IngredientInsight> potentialIrritants,
    @JsonKey(name: 'comedogenic_rating')
    required final String comedogenicRating,
    required final String recommendation,
    @JsonKey(name: 'safety_score') required final double safetyScore,
  }) = _$AnalysisResultImpl;

  factory _AnalysisResult.fromJson(Map<String, dynamic> json) =
      _$AnalysisResultImpl.fromJson;

  @override
  String get summary;
  @override
  @JsonKey(name: 'key_actives')
  List<IngredientInsight> get keyActives;
  @override
  @JsonKey(name: 'potential_irritants')
  List<IngredientInsight> get potentialIrritants;
  @override
  @JsonKey(name: 'comedogenic_rating')
  String get comedogenicRating;
  @override
  String get recommendation;
  @override
  @JsonKey(name: 'safety_score')
  double get safetyScore;

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisResultImplCopyWith<_$AnalysisResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IngredientInsight _$IngredientInsightFromJson(Map<String, dynamic> json) {
  return _IngredientInsight.fromJson(json);
}

/// @nodoc
mixin _$IngredientInsight {
  String get name => throw _privateConstructorUsedError;
  String? get benefit => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this IngredientInsight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IngredientInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientInsightCopyWith<IngredientInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientInsightCopyWith<$Res> {
  factory $IngredientInsightCopyWith(
    IngredientInsight value,
    $Res Function(IngredientInsight) then,
  ) = _$IngredientInsightCopyWithImpl<$Res, IngredientInsight>;
  @useResult
  $Res call({String name, String? benefit, String? reason});
}

/// @nodoc
class _$IngredientInsightCopyWithImpl<$Res, $Val extends IngredientInsight>
    implements $IngredientInsightCopyWith<$Res> {
  _$IngredientInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? benefit = freezed,
    Object? reason = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            benefit: freezed == benefit
                ? _value.benefit
                : benefit // ignore: cast_nullable_to_non_nullable
                      as String?,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IngredientInsightImplCopyWith<$Res>
    implements $IngredientInsightCopyWith<$Res> {
  factory _$$IngredientInsightImplCopyWith(
    _$IngredientInsightImpl value,
    $Res Function(_$IngredientInsightImpl) then,
  ) = __$$IngredientInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? benefit, String? reason});
}

/// @nodoc
class __$$IngredientInsightImplCopyWithImpl<$Res>
    extends _$IngredientInsightCopyWithImpl<$Res, _$IngredientInsightImpl>
    implements _$$IngredientInsightImplCopyWith<$Res> {
  __$$IngredientInsightImplCopyWithImpl(
    _$IngredientInsightImpl _value,
    $Res Function(_$IngredientInsightImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IngredientInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? benefit = freezed,
    Object? reason = freezed,
  }) {
    return _then(
      _$IngredientInsightImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        benefit: freezed == benefit
            ? _value.benefit
            : benefit // ignore: cast_nullable_to_non_nullable
                  as String?,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientInsightImpl implements _IngredientInsight {
  const _$IngredientInsightImpl({
    required this.name,
    this.benefit,
    this.reason,
  });

  factory _$IngredientInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientInsightImplFromJson(json);

  @override
  final String name;
  @override
  final String? benefit;
  @override
  final String? reason;

  @override
  String toString() {
    return 'IngredientInsight(name: $name, benefit: $benefit, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientInsightImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.benefit, benefit) || other.benefit == benefit) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, benefit, reason);

  /// Create a copy of IngredientInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientInsightImplCopyWith<_$IngredientInsightImpl> get copyWith =>
      __$$IngredientInsightImplCopyWithImpl<_$IngredientInsightImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientInsightImplToJson(this);
  }
}

abstract class _IngredientInsight implements IngredientInsight {
  const factory _IngredientInsight({
    required final String name,
    final String? benefit,
    final String? reason,
  }) = _$IngredientInsightImpl;

  factory _IngredientInsight.fromJson(Map<String, dynamic> json) =
      _$IngredientInsightImpl.fromJson;

  @override
  String get name;
  @override
  String? get benefit;
  @override
  String? get reason;

  /// Create a copy of IngredientInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientInsightImplCopyWith<_$IngredientInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
