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
  List<String> get phoneNumbers =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'profile_image')
  String get profileUrl => throw _privateConstructorUsedError;
  List<String> get publicAssessmentRefs => throw _privateConstructorUsedError;
  List<String> get editors => throw _privateConstructorUsedError;

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
      List<String> phoneNumbers,
      @JsonKey(name: 'profile_image') String profileUrl,
      List<String> publicAssessmentRefs,
      List<String> editors});
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
    Object? phoneNumbers = null,
    Object? profileUrl = null,
    Object? publicAssessmentRefs = null,
    Object? editors = null,
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
      phoneNumbers: null == phoneNumbers
          ? _value.phoneNumbers
          : phoneNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profileUrl: null == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publicAssessmentRefs: null == publicAssessmentRefs
          ? _value.publicAssessmentRefs
          : publicAssessmentRefs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editors: null == editors
          ? _value.editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      List<String> phoneNumbers,
      @JsonKey(name: 'profile_image') String profileUrl,
      List<String> publicAssessmentRefs,
      List<String> editors});
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
    Object? phoneNumbers = null,
    Object? profileUrl = null,
    Object? publicAssessmentRefs = null,
    Object? editors = null,
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
      phoneNumbers: null == phoneNumbers
          ? _value._phoneNumbers
          : phoneNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profileUrl: null == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publicAssessmentRefs: null == publicAssessmentRefs
          ? _value._publicAssessmentRefs
          : publicAssessmentRefs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editors: null == editors
          ? _value._editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      required final List<String> phoneNumbers,
      @JsonKey(name: 'profile_image') required this.profileUrl,
      required final List<String> publicAssessmentRefs,
      required final List<String> editors})
      : _phoneNumbers = phoneNumbers,
        _publicAssessmentRefs = publicAssessmentRefs,
        _editors = editors;

  factory _$InstituteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstituteModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String address;
  final List<String> _phoneNumbers;
  @override
  List<String> get phoneNumbers {
    if (_phoneNumbers is EqualUnmodifiableListView) return _phoneNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phoneNumbers);
  }

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'profile_image')
  final String profileUrl;
  final List<String> _publicAssessmentRefs;
  @override
  List<String> get publicAssessmentRefs {
    if (_publicAssessmentRefs is EqualUnmodifiableListView)
      return _publicAssessmentRefs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_publicAssessmentRefs);
  }

  final List<String> _editors;
  @override
  List<String> get editors {
    if (_editors is EqualUnmodifiableListView) return _editors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editors);
  }

  @override
  String toString() {
    return 'InstituteModel(id: $id, name: $name, address: $address, phoneNumbers: $phoneNumbers, profileUrl: $profileUrl, publicAssessmentRefs: $publicAssessmentRefs, editors: $editors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstituteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._phoneNumbers, _phoneNumbers) &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl) &&
            const DeepCollectionEquality()
                .equals(other._publicAssessmentRefs, _publicAssessmentRefs) &&
            const DeepCollectionEquality().equals(other._editors, _editors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      const DeepCollectionEquality().hash(_phoneNumbers),
      profileUrl,
      const DeepCollectionEquality().hash(_publicAssessmentRefs),
      const DeepCollectionEquality().hash(_editors));

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
      required final List<String> phoneNumbers,
      @JsonKey(name: 'profile_image') required final String profileUrl,
      required final List<String> publicAssessmentRefs,
      required final List<String> editors}) = _$InstituteModelImpl;

  factory _InstituteModel.fromJson(Map<String, dynamic> json) =
      _$InstituteModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get address;
  @override
  List<String> get phoneNumbers; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'profile_image')
  String get profileUrl;
  @override
  List<String> get publicAssessmentRefs;
  @override
  List<String> get editors;

  /// Create a copy of InstituteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstituteModelImplCopyWith<_$InstituteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
