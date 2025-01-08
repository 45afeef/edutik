// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'institute_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InstituteModel _$InstituteModelFromJson(Map<String, dynamic> json) {
  return _InstituteModel.fromJson(json);
}

/// @nodoc
mixin _$InstituteModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String get profileUrl => throw _privateConstructorUsedError;

  /// Serializes this InstituteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InstituteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstituteModelCopyWith<InstituteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstituteModelCopyWith<$Res> {
  factory $InstituteModelCopyWith(
          InstituteModel value, $Res Function(InstituteModel) then) =
      _$InstituteModelCopyWithImpl<$Res, InstituteModel>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String address,
      @JsonKey(name: 'profile_image') String profileUrl});
}

/// @nodoc
class _$InstituteModelCopyWithImpl<$Res, $Val extends InstituteModel>
    implements $InstituteModelCopyWith<$Res> {
  _$InstituteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstituteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? address = null,
    Object? profileUrl = null,
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
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      profileUrl: null == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstituteModelImplCopyWith<$Res>
    implements $InstituteModelCopyWith<$Res> {
  factory _$$InstituteModelImplCopyWith(_$InstituteModelImpl value,
          $Res Function(_$InstituteModelImpl) then) =
      __$$InstituteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String address,
      @JsonKey(name: 'profile_image') String profileUrl});
}

/// @nodoc
class __$$InstituteModelImplCopyWithImpl<$Res>
    extends _$InstituteModelCopyWithImpl<$Res, _$InstituteModelImpl>
    implements _$$InstituteModelImplCopyWith<$Res> {
  __$$InstituteModelImplCopyWithImpl(
      _$InstituteModelImpl _value, $Res Function(_$InstituteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstituteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? address = null,
    Object? profileUrl = null,
  }) {
    return _then(_$InstituteModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      profileUrl: null == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstituteModelImpl implements _InstituteModel {
  _$InstituteModelImpl(
      {this.id,
      required this.name,
      required this.address,
      @JsonKey(name: 'profile_image') required this.profileUrl});

  factory _$InstituteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstituteModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String address;
  @override
  @JsonKey(name: 'profile_image')
  final String profileUrl;

  @override
  String toString() {
    return 'InstituteModel(id: $id, name: $name, address: $address, profileUrl: $profileUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstituteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, profileUrl);

  /// Create a copy of InstituteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstituteModelImplCopyWith<_$InstituteModelImpl> get copyWith =>
      __$$InstituteModelImplCopyWithImpl<_$InstituteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstituteModelImplToJson(
      this,
    );
  }
}

abstract class _InstituteModel implements InstituteModel {
  factory _InstituteModel(
          {final String? id,
          required final String name,
          required final String address,
          @JsonKey(name: 'profile_image') required final String profileUrl}) =
      _$InstituteModelImpl;

  factory _InstituteModel.fromJson(Map<String, dynamic> json) =
      _$InstituteModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get address;
  @override
  @JsonKey(name: 'profile_image')
  String get profileUrl;

  /// Create a copy of InstituteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstituteModelImplCopyWith<_$InstituteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
