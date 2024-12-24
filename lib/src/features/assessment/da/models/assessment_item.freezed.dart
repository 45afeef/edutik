// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssessmentItemModel _$AssessmentItemModelFromJson(Map<String, dynamic> json) {
  return _$MCQ.fromJson(json);
}

/// @nodoc
mixin _$AssessmentItemModel {
  String get question => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  int get correctOption => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String question, List<String> options, int correctOption)
        mcq,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String question, List<String> options, int correctOption)?
        mcq,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String question, List<String> options, int correctOption)?
        mcq,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$MCQ value) mcq,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$MCQ value)? mcq,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$MCQ value)? mcq,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this AssessmentItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentItemModelCopyWith<AssessmentItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentItemModelCopyWith<$Res> {
  factory $AssessmentItemModelCopyWith(
          AssessmentItemModel value, $Res Function(AssessmentItemModel) then) =
      _$AssessmentItemModelCopyWithImpl<$Res, AssessmentItemModel>;
  @useResult
  $Res call({String question, List<String> options, int correctOption});
}

/// @nodoc
class _$AssessmentItemModelCopyWithImpl<$Res, $Val extends AssessmentItemModel>
    implements $AssessmentItemModelCopyWith<$Res> {
  _$AssessmentItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? options = null,
    Object? correctOption = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctOption: null == correctOption
          ? _value.correctOption
          : correctOption // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$MCQImplCopyWith<$Res>
    implements $AssessmentItemModelCopyWith<$Res> {
  factory _$$$MCQImplCopyWith(
          _$$MCQImpl value, $Res Function(_$$MCQImpl) then) =
      __$$$MCQImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, List<String> options, int correctOption});
}

/// @nodoc
class __$$$MCQImplCopyWithImpl<$Res>
    extends _$AssessmentItemModelCopyWithImpl<$Res, _$$MCQImpl>
    implements _$$$MCQImplCopyWith<$Res> {
  __$$$MCQImplCopyWithImpl(_$$MCQImpl _value, $Res Function(_$$MCQImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? options = null,
    Object? correctOption = null,
  }) {
    return _then(_$$MCQImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctOption: null == correctOption
          ? _value.correctOption
          : correctOption // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$MCQImpl implements _$MCQ {
  const _$$MCQImpl(
      {required this.question,
      required final List<String> options,
      required this.correctOption})
      : _options = options;

  factory _$$MCQImpl.fromJson(Map<String, dynamic> json) =>
      _$$$MCQImplFromJson(json);

  @override
  final String question;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int correctOption;

  @override
  String toString() {
    return 'AssessmentItemModel.mcq(question: $question, options: $options, correctOption: $correctOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$MCQImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctOption, correctOption) ||
                other.correctOption == correctOption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question,
      const DeepCollectionEquality().hash(_options), correctOption);

  /// Create a copy of AssessmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$MCQImplCopyWith<_$$MCQImpl> get copyWith =>
      __$$$MCQImplCopyWithImpl<_$$MCQImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String question, List<String> options, int correctOption)
        mcq,
  }) {
    return mcq(question, options, correctOption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String question, List<String> options, int correctOption)?
        mcq,
  }) {
    return mcq?.call(question, options, correctOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String question, List<String> options, int correctOption)?
        mcq,
    required TResult orElse(),
  }) {
    if (mcq != null) {
      return mcq(question, options, correctOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$MCQ value) mcq,
  }) {
    return mcq(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$MCQ value)? mcq,
  }) {
    return mcq?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$MCQ value)? mcq,
    required TResult orElse(),
  }) {
    if (mcq != null) {
      return mcq(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$$MCQImplToJson(
      this,
    );
  }
}

abstract class _$MCQ implements AssessmentItemModel {
  const factory _$MCQ(
      {required final String question,
      required final List<String> options,
      required final int correctOption}) = _$$MCQImpl;

  factory _$MCQ.fromJson(Map<String, dynamic> json) = _$$MCQImpl.fromJson;

  @override
  String get question;
  @override
  List<String> get options;
  @override
  int get correctOption;

  /// Create a copy of AssessmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$MCQImplCopyWith<_$$MCQImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
