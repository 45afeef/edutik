// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mcq_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

McqModel _$McqModelFromJson(Map<String, dynamic> json) {
  return _McqModel.fromJson(json);
}

/// @nodoc
mixin _$McqModel {
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;

  /// Serializes this McqModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of McqModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $McqModelCopyWith<McqModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $McqModelCopyWith<$Res> {
  factory $McqModelCopyWith(McqModel value, $Res Function(McqModel) then) =
      _$McqModelCopyWithImpl<$Res, McqModel>;
  @useResult
  $Res call({String question, String answer, List<String> options});
}

/// @nodoc
class _$McqModelCopyWithImpl<$Res, $Val extends McqModel>
    implements $McqModelCopyWith<$Res> {
  _$McqModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of McqModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$McqModelImplCopyWith<$Res>
    implements $McqModelCopyWith<$Res> {
  factory _$$McqModelImplCopyWith(
          _$McqModelImpl value, $Res Function(_$McqModelImpl) then) =
      __$$McqModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String answer, List<String> options});
}

/// @nodoc
class __$$McqModelImplCopyWithImpl<$Res>
    extends _$McqModelCopyWithImpl<$Res, _$McqModelImpl>
    implements _$$McqModelImplCopyWith<$Res> {
  __$$McqModelImplCopyWithImpl(
      _$McqModelImpl _value, $Res Function(_$McqModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of McqModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
    Object? options = null,
  }) {
    return _then(_$McqModelImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$McqModelImpl implements _McqModel {
  _$McqModelImpl(
      {required this.question,
      required this.answer,
      required final List<String> options})
      : _options = options;

  factory _$McqModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$McqModelImplFromJson(json);

  @override
  final String question;
  @override
  final String answer;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'McqModel(question: $question, answer: $answer, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$McqModelImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer,
      const DeepCollectionEquality().hash(_options));

  /// Create a copy of McqModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$McqModelImplCopyWith<_$McqModelImpl> get copyWith =>
      __$$McqModelImplCopyWithImpl<_$McqModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$McqModelImplToJson(
      this,
    );
  }
}

abstract class _McqModel implements McqModel {
  factory _McqModel(
      {required final String question,
      required final String answer,
      required final List<String> options}) = _$McqModelImpl;

  factory _McqModel.fromJson(Map<String, dynamic> json) =
      _$McqModelImpl.fromJson;

  @override
  String get question;
  @override
  String get answer;
  @override
  List<String> get options;

  /// Create a copy of McqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$McqModelImplCopyWith<_$McqModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
