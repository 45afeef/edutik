// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'syllabus_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SyllabusModel _$SyllabusModelFromJson(Map<String, dynamic> json) {
  return _SyllabusModel.fromJson(json);
}

/// @nodoc
mixin _$SyllabusModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get academicLevel => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<ModuleModel> get modules => throw _privateConstructorUsedError;

  /// Serializes this SyllabusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyllabusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyllabusModelCopyWith<SyllabusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyllabusModelCopyWith<$Res> {
  factory $SyllabusModelCopyWith(
          SyllabusModel value, $Res Function(SyllabusModel) then) =
      _$SyllabusModelCopyWithImpl<$Res, SyllabusModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String academicLevel,
      String language,
      Duration duration,
      String createdBy,
      DateTime updatedAt,
      List<ModuleModel> modules});
}

/// @nodoc
class _$SyllabusModelCopyWithImpl<$Res, $Val extends SyllabusModel>
    implements $SyllabusModelCopyWith<$Res> {
  _$SyllabusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyllabusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? academicLevel = null,
    Object? language = null,
    Object? duration = null,
    Object? createdBy = null,
    Object? updatedAt = null,
    Object? modules = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      academicLevel: null == academicLevel
          ? _value.academicLevel
          : academicLevel // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modules: null == modules
          ? _value.modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<ModuleModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyllabusModelImplCopyWith<$Res>
    implements $SyllabusModelCopyWith<$Res> {
  factory _$$SyllabusModelImplCopyWith(
          _$SyllabusModelImpl value, $Res Function(_$SyllabusModelImpl) then) =
      __$$SyllabusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String academicLevel,
      String language,
      Duration duration,
      String createdBy,
      DateTime updatedAt,
      List<ModuleModel> modules});
}

/// @nodoc
class __$$SyllabusModelImplCopyWithImpl<$Res>
    extends _$SyllabusModelCopyWithImpl<$Res, _$SyllabusModelImpl>
    implements _$$SyllabusModelImplCopyWith<$Res> {
  __$$SyllabusModelImplCopyWithImpl(
      _$SyllabusModelImpl _value, $Res Function(_$SyllabusModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyllabusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? academicLevel = null,
    Object? language = null,
    Object? duration = null,
    Object? createdBy = null,
    Object? updatedAt = null,
    Object? modules = null,
  }) {
    return _then(_$SyllabusModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      academicLevel: null == academicLevel
          ? _value.academicLevel
          : academicLevel // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modules: null == modules
          ? _value._modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<ModuleModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyllabusModelImpl implements _SyllabusModel {
  _$SyllabusModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.academicLevel,
      required this.language,
      required this.duration,
      required this.createdBy,
      required this.updatedAt,
      required final List<ModuleModel> modules})
      : _modules = modules;

  factory _$SyllabusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyllabusModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String academicLevel;
  @override
  final String language;
  @override
  final Duration duration;
  @override
  final String createdBy;
  @override
  final DateTime updatedAt;
  final List<ModuleModel> _modules;
  @override
  List<ModuleModel> get modules {
    if (_modules is EqualUnmodifiableListView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modules);
  }

  @override
  String toString() {
    return 'SyllabusModel(id: $id, title: $title, description: $description, academicLevel: $academicLevel, language: $language, duration: $duration, createdBy: $createdBy, updatedAt: $updatedAt, modules: $modules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyllabusModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.academicLevel, academicLevel) ||
                other.academicLevel == academicLevel) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._modules, _modules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      academicLevel,
      language,
      duration,
      createdBy,
      updatedAt,
      const DeepCollectionEquality().hash(_modules));

  /// Create a copy of SyllabusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyllabusModelImplCopyWith<_$SyllabusModelImpl> get copyWith =>
      __$$SyllabusModelImplCopyWithImpl<_$SyllabusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyllabusModelImplToJson(
      this,
    );
  }
}

abstract class _SyllabusModel implements SyllabusModel {
  factory _SyllabusModel(
      {required final String id,
      required final String title,
      required final String description,
      required final String academicLevel,
      required final String language,
      required final Duration duration,
      required final String createdBy,
      required final DateTime updatedAt,
      required final List<ModuleModel> modules}) = _$SyllabusModelImpl;

  factory _SyllabusModel.fromJson(Map<String, dynamic> json) =
      _$SyllabusModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get academicLevel;
  @override
  String get language;
  @override
  Duration get duration;
  @override
  String get createdBy;
  @override
  DateTime get updatedAt;
  @override
  List<ModuleModel> get modules;

  /// Create a copy of SyllabusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyllabusModelImplCopyWith<_$SyllabusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
