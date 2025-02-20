// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) {
  return _CourseModel.fromJson(json);
}

/// @nodoc
mixin _$CourseModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  PriceModel get price => throw _privateConstructorUsedError;
  SyllabusModel? get syllabus => throw _privateConstructorUsedError;
  String get bannerImageUri => throw _privateConstructorUsedError;
  String get creatorName => throw _privateConstructorUsedError;
  String get creatorRef => throw _privateConstructorUsedError;
  String get ownerName => throw _privateConstructorUsedError;
  String get ownerRef => throw _privateConstructorUsedError;
  UserType get creatorType => throw _privateConstructorUsedError;
  UserType get ownerType => throw _privateConstructorUsedError;

  /// Serializes this CourseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseModelCopyWith<CourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseModelCopyWith<$Res> {
  factory $CourseModelCopyWith(
          CourseModel value, $Res Function(CourseModel) then) =
      _$CourseModelCopyWithImpl<$Res, CourseModel>;
  @useResult
  $Res call(
      {String? id,
      String name,
      PriceModel price,
      SyllabusModel? syllabus,
      String bannerImageUri,
      String creatorName,
      String creatorRef,
      String ownerName,
      String ownerRef,
      UserType creatorType,
      UserType ownerType});

  $PriceModelCopyWith<$Res> get price;
  $SyllabusModelCopyWith<$Res>? get syllabus;
}

/// @nodoc
class _$CourseModelCopyWithImpl<$Res, $Val extends CourseModel>
    implements $CourseModelCopyWith<$Res> {
  _$CourseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? price = null,
    Object? syllabus = freezed,
    Object? bannerImageUri = null,
    Object? creatorName = null,
    Object? creatorRef = null,
    Object? ownerName = null,
    Object? ownerRef = null,
    Object? creatorType = null,
    Object? ownerType = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceModel,
      syllabus: freezed == syllabus
          ? _value.syllabus
          : syllabus // ignore: cast_nullable_to_non_nullable
              as SyllabusModel?,
      bannerImageUri: null == bannerImageUri
          ? _value.bannerImageUri
          : bannerImageUri // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      creatorRef: null == creatorRef
          ? _value.creatorRef
          : creatorRef // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerRef: null == ownerRef
          ? _value.ownerRef
          : ownerRef // ignore: cast_nullable_to_non_nullable
              as String,
      creatorType: null == creatorType
          ? _value.creatorType
          : creatorType // ignore: cast_nullable_to_non_nullable
              as UserType,
      ownerType: null == ownerType
          ? _value.ownerType
          : ownerType // ignore: cast_nullable_to_non_nullable
              as UserType,
    ) as $Val);
  }

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PriceModelCopyWith<$Res> get price {
    return $PriceModelCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyllabusModelCopyWith<$Res>? get syllabus {
    if (_value.syllabus == null) {
      return null;
    }

    return $SyllabusModelCopyWith<$Res>(_value.syllabus!, (value) {
      return _then(_value.copyWith(syllabus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseModelImplCopyWith<$Res>
    implements $CourseModelCopyWith<$Res> {
  factory _$$CourseModelImplCopyWith(
          _$CourseModelImpl value, $Res Function(_$CourseModelImpl) then) =
      __$$CourseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      PriceModel price,
      SyllabusModel? syllabus,
      String bannerImageUri,
      String creatorName,
      String creatorRef,
      String ownerName,
      String ownerRef,
      UserType creatorType,
      UserType ownerType});

  @override
  $PriceModelCopyWith<$Res> get price;
  @override
  $SyllabusModelCopyWith<$Res>? get syllabus;
}

/// @nodoc
class __$$CourseModelImplCopyWithImpl<$Res>
    extends _$CourseModelCopyWithImpl<$Res, _$CourseModelImpl>
    implements _$$CourseModelImplCopyWith<$Res> {
  __$$CourseModelImplCopyWithImpl(
      _$CourseModelImpl _value, $Res Function(_$CourseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? price = null,
    Object? syllabus = freezed,
    Object? bannerImageUri = null,
    Object? creatorName = null,
    Object? creatorRef = null,
    Object? ownerName = null,
    Object? ownerRef = null,
    Object? creatorType = null,
    Object? ownerType = null,
  }) {
    return _then(_$CourseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceModel,
      syllabus: freezed == syllabus
          ? _value.syllabus
          : syllabus // ignore: cast_nullable_to_non_nullable
              as SyllabusModel?,
      bannerImageUri: null == bannerImageUri
          ? _value.bannerImageUri
          : bannerImageUri // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      creatorRef: null == creatorRef
          ? _value.creatorRef
          : creatorRef // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerRef: null == ownerRef
          ? _value.ownerRef
          : ownerRef // ignore: cast_nullable_to_non_nullable
              as String,
      creatorType: null == creatorType
          ? _value.creatorType
          : creatorType // ignore: cast_nullable_to_non_nullable
              as UserType,
      ownerType: null == ownerType
          ? _value.ownerType
          : ownerType // ignore: cast_nullable_to_non_nullable
              as UserType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseModelImpl implements _CourseModel {
  _$CourseModelImpl(
      {this.id,
      required this.name,
      required this.price,
      this.syllabus,
      required this.bannerImageUri,
      required this.creatorName,
      required this.creatorRef,
      required this.ownerName,
      required this.ownerRef,
      required this.creatorType,
      required this.ownerType});

  factory _$CourseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final PriceModel price;
  @override
  final SyllabusModel? syllabus;
  @override
  final String bannerImageUri;
  @override
  final String creatorName;
  @override
  final String creatorRef;
  @override
  final String ownerName;
  @override
  final String ownerRef;
  @override
  final UserType creatorType;
  @override
  final UserType ownerType;

  @override
  String toString() {
    return 'CourseModel(id: $id, name: $name, price: $price, syllabus: $syllabus, bannerImageUri: $bannerImageUri, creatorName: $creatorName, creatorRef: $creatorRef, ownerName: $ownerName, ownerRef: $ownerRef, creatorType: $creatorType, ownerType: $ownerType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.syllabus, syllabus) ||
                other.syllabus == syllabus) &&
            (identical(other.bannerImageUri, bannerImageUri) ||
                other.bannerImageUri == bannerImageUri) &&
            (identical(other.creatorName, creatorName) ||
                other.creatorName == creatorName) &&
            (identical(other.creatorRef, creatorRef) ||
                other.creatorRef == creatorRef) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.ownerRef, ownerRef) ||
                other.ownerRef == ownerRef) &&
            (identical(other.creatorType, creatorType) ||
                other.creatorType == creatorType) &&
            (identical(other.ownerType, ownerType) ||
                other.ownerType == ownerType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      price,
      syllabus,
      bannerImageUri,
      creatorName,
      creatorRef,
      ownerName,
      ownerRef,
      creatorType,
      ownerType);

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseModelImplCopyWith<_$CourseModelImpl> get copyWith =>
      __$$CourseModelImplCopyWithImpl<_$CourseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseModelImplToJson(
      this,
    );
  }
}

abstract class _CourseModel implements CourseModel {
  factory _CourseModel(
      {final String? id,
      required final String name,
      required final PriceModel price,
      final SyllabusModel? syllabus,
      required final String bannerImageUri,
      required final String creatorName,
      required final String creatorRef,
      required final String ownerName,
      required final String ownerRef,
      required final UserType creatorType,
      required final UserType ownerType}) = _$CourseModelImpl;

  factory _CourseModel.fromJson(Map<String, dynamic> json) =
      _$CourseModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  PriceModel get price;
  @override
  SyllabusModel? get syllabus;
  @override
  String get bannerImageUri;
  @override
  String get creatorName;
  @override
  String get creatorRef;
  @override
  String get ownerName;
  @override
  String get ownerRef;
  @override
  UserType get creatorType;
  @override
  UserType get ownerType;

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseModelImplCopyWith<_$CourseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
