// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssessmentModel _$AssessmentModelFromJson(Map<String, dynamic> json) {
  return _AssessmentModel.fromJson(json);
}

/// @nodoc
mixin _$AssessmentModel {
  String get name => throw _privateConstructorUsedError;
  AssessmentType get type => throw _privateConstructorUsedError;
  List<AssessmentItemModel> get items => throw _privateConstructorUsedError;

  /// Serializes this AssessmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentModelCopyWith<AssessmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentModelCopyWith<$Res> {
  factory $AssessmentModelCopyWith(
          AssessmentModel value, $Res Function(AssessmentModel) then) =
      _$AssessmentModelCopyWithImpl<$Res, AssessmentModel>;
  @useResult
  $Res call(
      {String name, AssessmentType type, List<AssessmentItemModel> items});
}

/// @nodoc
class _$AssessmentModelCopyWithImpl<$Res, $Val extends AssessmentModel>
    implements $AssessmentModelCopyWith<$Res> {
  _$AssessmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AssessmentType,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AssessmentItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentModelImplCopyWith<$Res>
    implements $AssessmentModelCopyWith<$Res> {
  factory _$$AssessmentModelImplCopyWith(_$AssessmentModelImpl value,
          $Res Function(_$AssessmentModelImpl) then) =
      __$$AssessmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, AssessmentType type, List<AssessmentItemModel> items});
}

/// @nodoc
class __$$AssessmentModelImplCopyWithImpl<$Res>
    extends _$AssessmentModelCopyWithImpl<$Res, _$AssessmentModelImpl>
    implements _$$AssessmentModelImplCopyWith<$Res> {
  __$$AssessmentModelImplCopyWithImpl(
      _$AssessmentModelImpl _value, $Res Function(_$AssessmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? items = null,
  }) {
    return _then(_$AssessmentModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AssessmentType,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AssessmentItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentModelImpl implements _AssessmentModel {
  const _$AssessmentModelImpl(
      {required this.name,
      required this.type,
      required final List<AssessmentItemModel> items})
      : _items = items;

  factory _$AssessmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentModelImplFromJson(json);

  @override
  final String name;
  @override
  final AssessmentType type;
  final List<AssessmentItemModel> _items;
  @override
  List<AssessmentItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AssessmentModel(name: $name, type: $type, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, type, const DeepCollectionEquality().hash(_items));

  /// Create a copy of AssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentModelImplCopyWith<_$AssessmentModelImpl> get copyWith =>
      __$$AssessmentModelImplCopyWithImpl<_$AssessmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentModelImplToJson(
      this,
    );
  }
}

abstract class _AssessmentModel implements AssessmentModel {
  const factory _AssessmentModel(
      {required final String name,
      required final AssessmentType type,
      required final List<AssessmentItemModel> items}) = _$AssessmentModelImpl;

  factory _AssessmentModel.fromJson(Map<String, dynamic> json) =
      _$AssessmentModelImpl.fromJson;

  @override
  String get name;
  @override
  AssessmentType get type;
  @override
  List<AssessmentItemModel> get items;

  /// Create a copy of AssessmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentModelImplCopyWith<_$AssessmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
