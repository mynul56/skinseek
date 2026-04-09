// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skin_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SkinProfile _$SkinProfileFromJson(Map<String, dynamic> json) {
  return _SkinProfile.fromJson(json);
}

/// @nodoc
mixin _$SkinProfile {
  SkinType? get skinType => throw _privateConstructorUsedError;
  List<SkinConcern> get concerns => throw _privateConstructorUsedError;
  List<SkinGoal> get goals => throw _privateConstructorUsedError;
  ExperienceLevel? get experienceLevel => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this SkinProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkinProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkinProfileCopyWith<SkinProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkinProfileCopyWith<$Res> {
  factory $SkinProfileCopyWith(
    SkinProfile value,
    $Res Function(SkinProfile) then,
  ) = _$SkinProfileCopyWithImpl<$Res, SkinProfile>;
  @useResult
  $Res call({
    SkinType? skinType,
    List<SkinConcern> concerns,
    List<SkinGoal> goals,
    ExperienceLevel? experienceLevel,
    bool isCompleted,
    DateTime? completedAt,
  });
}

/// @nodoc
class _$SkinProfileCopyWithImpl<$Res, $Val extends SkinProfile>
    implements $SkinProfileCopyWith<$Res> {
  _$SkinProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkinProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skinType = freezed,
    Object? concerns = null,
    Object? goals = null,
    Object? experienceLevel = freezed,
    Object? isCompleted = null,
    Object? completedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            skinType: freezed == skinType
                ? _value.skinType
                : skinType // ignore: cast_nullable_to_non_nullable
                      as SkinType?,
            concerns: null == concerns
                ? _value.concerns
                : concerns // ignore: cast_nullable_to_non_nullable
                      as List<SkinConcern>,
            goals: null == goals
                ? _value.goals
                : goals // ignore: cast_nullable_to_non_nullable
                      as List<SkinGoal>,
            experienceLevel: freezed == experienceLevel
                ? _value.experienceLevel
                : experienceLevel // ignore: cast_nullable_to_non_nullable
                      as ExperienceLevel?,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SkinProfileImplCopyWith<$Res>
    implements $SkinProfileCopyWith<$Res> {
  factory _$$SkinProfileImplCopyWith(
    _$SkinProfileImpl value,
    $Res Function(_$SkinProfileImpl) then,
  ) = __$$SkinProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SkinType? skinType,
    List<SkinConcern> concerns,
    List<SkinGoal> goals,
    ExperienceLevel? experienceLevel,
    bool isCompleted,
    DateTime? completedAt,
  });
}

/// @nodoc
class __$$SkinProfileImplCopyWithImpl<$Res>
    extends _$SkinProfileCopyWithImpl<$Res, _$SkinProfileImpl>
    implements _$$SkinProfileImplCopyWith<$Res> {
  __$$SkinProfileImplCopyWithImpl(
    _$SkinProfileImpl _value,
    $Res Function(_$SkinProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SkinProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skinType = freezed,
    Object? concerns = null,
    Object? goals = null,
    Object? experienceLevel = freezed,
    Object? isCompleted = null,
    Object? completedAt = freezed,
  }) {
    return _then(
      _$SkinProfileImpl(
        skinType: freezed == skinType
            ? _value.skinType
            : skinType // ignore: cast_nullable_to_non_nullable
                  as SkinType?,
        concerns: null == concerns
            ? _value._concerns
            : concerns // ignore: cast_nullable_to_non_nullable
                  as List<SkinConcern>,
        goals: null == goals
            ? _value._goals
            : goals // ignore: cast_nullable_to_non_nullable
                  as List<SkinGoal>,
        experienceLevel: freezed == experienceLevel
            ? _value.experienceLevel
            : experienceLevel // ignore: cast_nullable_to_non_nullable
                  as ExperienceLevel?,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SkinProfileImpl implements _SkinProfile {
  const _$SkinProfileImpl({
    this.skinType,
    final List<SkinConcern> concerns = const [],
    final List<SkinGoal> goals = const [],
    this.experienceLevel,
    this.isCompleted = false,
    this.completedAt,
  }) : _concerns = concerns,
       _goals = goals;

  factory _$SkinProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkinProfileImplFromJson(json);

  @override
  final SkinType? skinType;
  final List<SkinConcern> _concerns;
  @override
  @JsonKey()
  List<SkinConcern> get concerns {
    if (_concerns is EqualUnmodifiableListView) return _concerns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_concerns);
  }

  final List<SkinGoal> _goals;
  @override
  @JsonKey()
  List<SkinGoal> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  final ExperienceLevel? experienceLevel;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'SkinProfile(skinType: $skinType, concerns: $concerns, goals: $goals, experienceLevel: $experienceLevel, isCompleted: $isCompleted, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkinProfileImpl &&
            (identical(other.skinType, skinType) ||
                other.skinType == skinType) &&
            const DeepCollectionEquality().equals(other._concerns, _concerns) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.experienceLevel, experienceLevel) ||
                other.experienceLevel == experienceLevel) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    skinType,
    const DeepCollectionEquality().hash(_concerns),
    const DeepCollectionEquality().hash(_goals),
    experienceLevel,
    isCompleted,
    completedAt,
  );

  /// Create a copy of SkinProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkinProfileImplCopyWith<_$SkinProfileImpl> get copyWith =>
      __$$SkinProfileImplCopyWithImpl<_$SkinProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkinProfileImplToJson(this);
  }
}

abstract class _SkinProfile implements SkinProfile {
  const factory _SkinProfile({
    final SkinType? skinType,
    final List<SkinConcern> concerns,
    final List<SkinGoal> goals,
    final ExperienceLevel? experienceLevel,
    final bool isCompleted,
    final DateTime? completedAt,
  }) = _$SkinProfileImpl;

  factory _SkinProfile.fromJson(Map<String, dynamic> json) =
      _$SkinProfileImpl.fromJson;

  @override
  SkinType? get skinType;
  @override
  List<SkinConcern> get concerns;
  @override
  List<SkinGoal> get goals;
  @override
  ExperienceLevel? get experienceLevel;
  @override
  bool get isCompleted;
  @override
  DateTime? get completedAt;

  /// Create a copy of SkinProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkinProfileImplCopyWith<_$SkinProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
