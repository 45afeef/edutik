// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BatchModel _$BatchModelFromJson(Map<String, dynamic> json) {
  return _BatchModel.fromJson(json);
}

/// @nodoc
mixin _$BatchModel {
  String? get id => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get startDate => throw _privateConstructorUsedError;
  int get endDate => throw _privateConstructorUsedError;
  List<UserProfileModel> get students => throw _privateConstructorUsedError;
  List<UserProfileModel> get teachers => throw _privateConstructorUsedError;
  List<UserProfileModel>? get mentors => throw _privateConstructorUsedError;
  List<dynamic>? get events => throw _privateConstructorUsedError;
  List<dynamic>? get achivements => throw _privateConstructorUsedError;
  List<String>? get assessments => throw _privateConstructorUsedError;
  List<ResourceModel>? get meterials => throw _privateConstructorUsedError;
  BatchStatus get status => throw _privateConstructorUsedError;

  /// Serializes this BatchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BatchModelCopyWith<BatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchModelCopyWith<$Res> {
  factory $BatchModelCopyWith(
          BatchModel value, $Res Function(BatchModel) then) =
      _$BatchModelCopyWithImpl<$Res, BatchModel>;
  @useResult
  $Res call(
      {String? id,
      String courseId,
      String name,
      int startDate,
      int endDate,
      List<UserProfileModel> students,
      List<UserProfileModel> teachers,
      List<UserProfileModel>? mentors,
      List<dynamic>? events,
      List<dynamic>? achivements,
      List<String>? assessments,
      List<ResourceModel>? meterials,
      BatchStatus status});
}

/// @nodoc
class _$BatchModelCopyWithImpl<$Res, $Val extends BatchModel>
    implements $BatchModelCopyWith<$Res> {
  _$BatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = null,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? students = null,
    Object? teachers = null,
    Object? mentors = freezed,
    Object? events = freezed,
    Object? achivements = freezed,
    Object? assessments = freezed,
    Object? meterials = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      teachers: null == teachers
          ? _value.teachers
          : teachers // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      mentors: freezed == mentors
          ? _value.mentors
          : mentors // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>?,
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      achivements: freezed == achivements
          ? _value.achivements
          : achivements // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      assessments: freezed == assessments
          ? _value.assessments
          : assessments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      meterials: freezed == meterials
          ? _value.meterials
          : meterials // ignore: cast_nullable_to_non_nullable
              as List<ResourceModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BatchStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchModelImplCopyWith<$Res>
    implements $BatchModelCopyWith<$Res> {
  factory _$$BatchModelImplCopyWith(
          _$BatchModelImpl value, $Res Function(_$BatchModelImpl) then) =
      __$$BatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String courseId,
      String name,
      int startDate,
      int endDate,
      List<UserProfileModel> students,
      List<UserProfileModel> teachers,
      List<UserProfileModel>? mentors,
      List<dynamic>? events,
      List<dynamic>? achivements,
      List<String>? assessments,
      List<ResourceModel>? meterials,
      BatchStatus status});
}

/// @nodoc
class __$$BatchModelImplCopyWithImpl<$Res>
    extends _$BatchModelCopyWithImpl<$Res, _$BatchModelImpl>
    implements _$$BatchModelImplCopyWith<$Res> {
  __$$BatchModelImplCopyWithImpl(
      _$BatchModelImpl _value, $Res Function(_$BatchModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = null,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? students = null,
    Object? teachers = null,
    Object? mentors = freezed,
    Object? events = freezed,
    Object? achivements = freezed,
    Object? assessments = freezed,
    Object? meterials = freezed,
    Object? status = null,
  }) {
    return _then(_$BatchModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
      students: null == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      teachers: null == teachers
          ? _value._teachers
          : teachers // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>,
      mentors: freezed == mentors
          ? _value._mentors
          : mentors // ignore: cast_nullable_to_non_nullable
              as List<UserProfileModel>?,
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      achivements: freezed == achivements
          ? _value._achivements
          : achivements // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      assessments: freezed == assessments
          ? _value._assessments
          : assessments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      meterials: freezed == meterials
          ? _value._meterials
          : meterials // ignore: cast_nullable_to_non_nullable
              as List<ResourceModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BatchStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchModelImpl implements _BatchModel {
  _$BatchModelImpl(
      {this.id,
      required this.courseId,
      required this.name,
      required this.startDate,
      required this.endDate,
      required final List<UserProfileModel> students,
      required final List<UserProfileModel> teachers,
      final List<UserProfileModel>? mentors,
      final List<dynamic>? events,
      final List<dynamic>? achivements,
      final List<String>? assessments,
      final List<ResourceModel>? meterials,
      required this.status})
      : _students = students,
        _teachers = teachers,
        _mentors = mentors,
        _events = events,
        _achivements = achivements,
        _assessments = assessments,
        _meterials = meterials;

  factory _$BatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String courseId;
  @override
  final String name;
  @override
  final int startDate;
  @override
  final int endDate;
  final List<UserProfileModel> _students;
  @override
  List<UserProfileModel> get students {
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_students);
  }

  final List<UserProfileModel> _teachers;
  @override
  List<UserProfileModel> get teachers {
    if (_teachers is EqualUnmodifiableListView) return _teachers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teachers);
  }

  final List<UserProfileModel>? _mentors;
  @override
  List<UserProfileModel>? get mentors {
    final value = _mentors;
    if (value == null) return null;
    if (_mentors is EqualUnmodifiableListView) return _mentors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _events;
  @override
  List<dynamic>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _achivements;
  @override
  List<dynamic>? get achivements {
    final value = _achivements;
    if (value == null) return null;
    if (_achivements is EqualUnmodifiableListView) return _achivements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _assessments;
  @override
  List<String>? get assessments {
    final value = _assessments;
    if (value == null) return null;
    if (_assessments is EqualUnmodifiableListView) return _assessments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ResourceModel>? _meterials;
  @override
  List<ResourceModel>? get meterials {
    final value = _meterials;
    if (value == null) return null;
    if (_meterials is EqualUnmodifiableListView) return _meterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final BatchStatus status;

  @override
  String toString() {
    return 'BatchModel(id: $id, courseId: $courseId, name: $name, startDate: $startDate, endDate: $endDate, students: $students, teachers: $teachers, mentors: $mentors, events: $events, achivements: $achivements, assessments: $assessments, meterials: $meterials, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            const DeepCollectionEquality().equals(other._teachers, _teachers) &&
            const DeepCollectionEquality().equals(other._mentors, _mentors) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality()
                .equals(other._achivements, _achivements) &&
            const DeepCollectionEquality()
                .equals(other._assessments, _assessments) &&
            const DeepCollectionEquality()
                .equals(other._meterials, _meterials) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      courseId,
      name,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_students),
      const DeepCollectionEquality().hash(_teachers),
      const DeepCollectionEquality().hash(_mentors),
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_achivements),
      const DeepCollectionEquality().hash(_assessments),
      const DeepCollectionEquality().hash(_meterials),
      status);

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchModelImplCopyWith<_$BatchModelImpl> get copyWith =>
      __$$BatchModelImplCopyWithImpl<_$BatchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchModelImplToJson(
      this,
    );
  }
}

abstract class _BatchModel implements BatchModel {
  factory _BatchModel(
      {final String? id,
      required final String courseId,
      required final String name,
      required final int startDate,
      required final int endDate,
      required final List<UserProfileModel> students,
      required final List<UserProfileModel> teachers,
      final List<UserProfileModel>? mentors,
      final List<dynamic>? events,
      final List<dynamic>? achivements,
      final List<String>? assessments,
      final List<ResourceModel>? meterials,
      required final BatchStatus status}) = _$BatchModelImpl;

  factory _BatchModel.fromJson(Map<String, dynamic> json) =
      _$BatchModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get courseId;
  @override
  String get name;
  @override
  int get startDate;
  @override
  int get endDate;
  @override
  List<UserProfileModel> get students;
  @override
  List<UserProfileModel> get teachers;
  @override
  List<UserProfileModel>? get mentors;
  @override
  List<dynamic>? get events;
  @override
  List<dynamic>? get achivements;
  @override
  List<String>? get assessments;
  @override
  List<ResourceModel>? get meterials;
  @override
  BatchStatus get status;

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchModelImplCopyWith<_$BatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
