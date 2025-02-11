// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BatchRequestModel _$BatchRequestModelFromJson(Map<String, dynamic> json) {
  return _BatchRequestModel.fromJson(json);
}

/// @nodoc
mixin _$BatchRequestModel {
  String? get id => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get batchId => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  BatchRequestStatus get status => throw _privateConstructorUsedError;

  /// Serializes this BatchRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BatchRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BatchRequestModelCopyWith<BatchRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchRequestModelCopyWith<$Res> {
  factory $BatchRequestModelCopyWith(
          BatchRequestModel value, $Res Function(BatchRequestModel) then) =
      _$BatchRequestModelCopyWithImpl<$Res, BatchRequestModel>;
  @useResult
  $Res call(
      {String? id,
      String courseId,
      String batchId,
      String studentId,
      BatchRequestStatus status});
}

/// @nodoc
class _$BatchRequestModelCopyWithImpl<$Res, $Val extends BatchRequestModel>
    implements $BatchRequestModelCopyWith<$Res> {
  _$BatchRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BatchRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = null,
    Object? batchId = null,
    Object? studentId = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BatchRequestStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchRequestModelImplCopyWith<$Res>
    implements $BatchRequestModelCopyWith<$Res> {
  factory _$$BatchRequestModelImplCopyWith(_$BatchRequestModelImpl value,
          $Res Function(_$BatchRequestModelImpl) then) =
      __$$BatchRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String courseId,
      String batchId,
      String studentId,
      BatchRequestStatus status});
}

/// @nodoc
class __$$BatchRequestModelImplCopyWithImpl<$Res>
    extends _$BatchRequestModelCopyWithImpl<$Res, _$BatchRequestModelImpl>
    implements _$$BatchRequestModelImplCopyWith<$Res> {
  __$$BatchRequestModelImplCopyWithImpl(_$BatchRequestModelImpl _value,
      $Res Function(_$BatchRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BatchRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = null,
    Object? batchId = null,
    Object? studentId = null,
    Object? status = null,
  }) {
    return _then(_$BatchRequestModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BatchRequestStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchRequestModelImpl implements _BatchRequestModel {
  _$BatchRequestModelImpl(
      {this.id,
      required this.courseId,
      required this.batchId,
      required this.studentId,
      required this.status});

  factory _$BatchRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchRequestModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String courseId;
  @override
  final String batchId;
  @override
  final String studentId;
  @override
  final BatchRequestStatus status;

  @override
  String toString() {
    return 'BatchRequestModel(id: $id, courseId: $courseId, batchId: $batchId, studentId: $studentId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, courseId, batchId, studentId, status);

  /// Create a copy of BatchRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchRequestModelImplCopyWith<_$BatchRequestModelImpl> get copyWith =>
      __$$BatchRequestModelImplCopyWithImpl<_$BatchRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchRequestModelImplToJson(
      this,
    );
  }
}

abstract class _BatchRequestModel implements BatchRequestModel {
  factory _BatchRequestModel(
      {final String? id,
      required final String courseId,
      required final String batchId,
      required final String studentId,
      required final BatchRequestStatus status}) = _$BatchRequestModelImpl;

  factory _BatchRequestModel.fromJson(Map<String, dynamic> json) =
      _$BatchRequestModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get courseId;
  @override
  String get batchId;
  @override
  String get studentId;
  @override
  BatchRequestStatus get status;

  /// Create a copy of BatchRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchRequestModelImplCopyWith<_$BatchRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
