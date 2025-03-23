// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssessmentItemResponseModel _$AssessmentItemResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AssessmentItemResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AssessmentItemResponseModel {
  int get timeTakenInMillisecond => throw _privateConstructorUsedError;
  String? get studentAnswer => throw _privateConstructorUsedError;
  String? get currectAnswer => throw _privateConstructorUsedError;

  /// Serializes this AssessmentItemResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentItemResponseModelCopyWith<AssessmentItemResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentItemResponseModelCopyWith<$Res> {
  factory $AssessmentItemResponseModelCopyWith(
          AssessmentItemResponseModel value,
          $Res Function(AssessmentItemResponseModel) then) =
      _$AssessmentItemResponseModelCopyWithImpl<$Res,
          AssessmentItemResponseModel>;
  @useResult
  $Res call(
      {int timeTakenInMillisecond,
      String? studentAnswer,
      String? currectAnswer});
}

/// @nodoc
class _$AssessmentItemResponseModelCopyWithImpl<$Res,
        $Val extends AssessmentItemResponseModel>
    implements $AssessmentItemResponseModelCopyWith<$Res> {
  _$AssessmentItemResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeTakenInMillisecond = null,
    Object? studentAnswer = freezed,
    Object? currectAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      timeTakenInMillisecond: null == timeTakenInMillisecond
          ? _value.timeTakenInMillisecond
          : timeTakenInMillisecond // ignore: cast_nullable_to_non_nullable
              as int,
      studentAnswer: freezed == studentAnswer
          ? _value.studentAnswer
          : studentAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      currectAnswer: freezed == currectAnswer
          ? _value.currectAnswer
          : currectAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentItemResponseModelImplCopyWith<$Res>
    implements $AssessmentItemResponseModelCopyWith<$Res> {
  factory _$$AssessmentItemResponseModelImplCopyWith(
          _$AssessmentItemResponseModelImpl value,
          $Res Function(_$AssessmentItemResponseModelImpl) then) =
      __$$AssessmentItemResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int timeTakenInMillisecond,
      String? studentAnswer,
      String? currectAnswer});
}

/// @nodoc
class __$$AssessmentItemResponseModelImplCopyWithImpl<$Res>
    extends _$AssessmentItemResponseModelCopyWithImpl<$Res,
        _$AssessmentItemResponseModelImpl>
    implements _$$AssessmentItemResponseModelImplCopyWith<$Res> {
  __$$AssessmentItemResponseModelImplCopyWithImpl(
      _$AssessmentItemResponseModelImpl _value,
      $Res Function(_$AssessmentItemResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeTakenInMillisecond = null,
    Object? studentAnswer = freezed,
    Object? currectAnswer = freezed,
  }) {
    return _then(_$AssessmentItemResponseModelImpl(
      timeTakenInMillisecond: null == timeTakenInMillisecond
          ? _value.timeTakenInMillisecond
          : timeTakenInMillisecond // ignore: cast_nullable_to_non_nullable
              as int,
      studentAnswer: freezed == studentAnswer
          ? _value.studentAnswer
          : studentAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      currectAnswer: freezed == currectAnswer
          ? _value.currectAnswer
          : currectAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentItemResponseModelImpl
    implements _AssessmentItemResponseModel {
  _$AssessmentItemResponseModelImpl(
      {required this.timeTakenInMillisecond,
      this.studentAnswer,
      this.currectAnswer});

  factory _$AssessmentItemResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AssessmentItemResponseModelImplFromJson(json);

  @override
  final int timeTakenInMillisecond;
  @override
  final String? studentAnswer;
  @override
  final String? currectAnswer;

  @override
  String toString() {
    return 'AssessmentItemResponseModel(timeTakenInMillisecond: $timeTakenInMillisecond, studentAnswer: $studentAnswer, currectAnswer: $currectAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentItemResponseModelImpl &&
            (identical(other.timeTakenInMillisecond, timeTakenInMillisecond) ||
                other.timeTakenInMillisecond == timeTakenInMillisecond) &&
            (identical(other.studentAnswer, studentAnswer) ||
                other.studentAnswer == studentAnswer) &&
            (identical(other.currectAnswer, currectAnswer) ||
                other.currectAnswer == currectAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, timeTakenInMillisecond, studentAnswer, currectAnswer);

  /// Create a copy of AssessmentItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentItemResponseModelImplCopyWith<_$AssessmentItemResponseModelImpl>
      get copyWith => __$$AssessmentItemResponseModelImplCopyWithImpl<
          _$AssessmentItemResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentItemResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AssessmentItemResponseModel
    implements AssessmentItemResponseModel {
  factory _AssessmentItemResponseModel(
      {required final int timeTakenInMillisecond,
      final String? studentAnswer,
      final String? currectAnswer}) = _$AssessmentItemResponseModelImpl;

  factory _AssessmentItemResponseModel.fromJson(Map<String, dynamic> json) =
      _$AssessmentItemResponseModelImpl.fromJson;

  @override
  int get timeTakenInMillisecond;
  @override
  String? get studentAnswer;
  @override
  String? get currectAnswer;

  /// Create a copy of AssessmentItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentItemResponseModelImplCopyWith<_$AssessmentItemResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AssessmentResultModel _$AssessmentResultModelFromJson(
    Map<String, dynamic> json) {
  return _AssessmentResultModel.fromJson(json);
}

/// @nodoc
mixin _$AssessmentResultModel {
  Map<int, AssessmentItemResponseModel> get studentResponse =>
      throw _privateConstructorUsedError;
  String get assessmentId => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;

  /// Serializes this AssessmentResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentResultModelCopyWith<AssessmentResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentResultModelCopyWith<$Res> {
  factory $AssessmentResultModelCopyWith(AssessmentResultModel value,
          $Res Function(AssessmentResultModel) then) =
      _$AssessmentResultModelCopyWithImpl<$Res, AssessmentResultModel>;
  @useResult
  $Res call(
      {Map<int, AssessmentItemResponseModel> studentResponse,
      String assessmentId,
      String studentId});
}

/// @nodoc
class _$AssessmentResultModelCopyWithImpl<$Res,
        $Val extends AssessmentResultModel>
    implements $AssessmentResultModelCopyWith<$Res> {
  _$AssessmentResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentResponse = null,
    Object? assessmentId = null,
    Object? studentId = null,
  }) {
    return _then(_value.copyWith(
      studentResponse: null == studentResponse
          ? _value.studentResponse
          : studentResponse // ignore: cast_nullable_to_non_nullable
              as Map<int, AssessmentItemResponseModel>,
      assessmentId: null == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentResultModelImplCopyWith<$Res>
    implements $AssessmentResultModelCopyWith<$Res> {
  factory _$$AssessmentResultModelImplCopyWith(
          _$AssessmentResultModelImpl value,
          $Res Function(_$AssessmentResultModelImpl) then) =
      __$$AssessmentResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<int, AssessmentItemResponseModel> studentResponse,
      String assessmentId,
      String studentId});
}

/// @nodoc
class __$$AssessmentResultModelImplCopyWithImpl<$Res>
    extends _$AssessmentResultModelCopyWithImpl<$Res,
        _$AssessmentResultModelImpl>
    implements _$$AssessmentResultModelImplCopyWith<$Res> {
  __$$AssessmentResultModelImplCopyWithImpl(_$AssessmentResultModelImpl _value,
      $Res Function(_$AssessmentResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentResponse = null,
    Object? assessmentId = null,
    Object? studentId = null,
  }) {
    return _then(_$AssessmentResultModelImpl(
      studentResponse: null == studentResponse
          ? _value._studentResponse
          : studentResponse // ignore: cast_nullable_to_non_nullable
              as Map<int, AssessmentItemResponseModel>,
      assessmentId: null == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentResultModelImpl implements _AssessmentResultModel {
  _$AssessmentResultModelImpl(
      {required final Map<int, AssessmentItemResponseModel> studentResponse,
      required this.assessmentId,
      required this.studentId})
      : _studentResponse = studentResponse;

  factory _$AssessmentResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentResultModelImplFromJson(json);

  final Map<int, AssessmentItemResponseModel> _studentResponse;
  @override
  Map<int, AssessmentItemResponseModel> get studentResponse {
    if (_studentResponse is EqualUnmodifiableMapView) return _studentResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_studentResponse);
  }

  @override
  final String assessmentId;
  @override
  final String studentId;

  @override
  String toString() {
    return 'AssessmentResultModel(studentResponse: $studentResponse, assessmentId: $assessmentId, studentId: $studentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentResultModelImpl &&
            const DeepCollectionEquality()
                .equals(other._studentResponse, _studentResponse) &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_studentResponse),
      assessmentId,
      studentId);

  /// Create a copy of AssessmentResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentResultModelImplCopyWith<_$AssessmentResultModelImpl>
      get copyWith => __$$AssessmentResultModelImplCopyWithImpl<
          _$AssessmentResultModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentResultModelImplToJson(
      this,
    );
  }
}

abstract class _AssessmentResultModel implements AssessmentResultModel {
  factory _AssessmentResultModel(
      {required final Map<int, AssessmentItemResponseModel> studentResponse,
      required final String assessmentId,
      required final String studentId}) = _$AssessmentResultModelImpl;

  factory _AssessmentResultModel.fromJson(Map<String, dynamic> json) =
      _$AssessmentResultModelImpl.fromJson;

  @override
  Map<int, AssessmentItemResponseModel> get studentResponse;
  @override
  String get assessmentId;
  @override
  String get studentId;

  /// Create a copy of AssessmentResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentResultModelImplCopyWith<_$AssessmentResultModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
