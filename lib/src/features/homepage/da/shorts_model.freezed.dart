// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shorts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShortsModel _$ShortsModelFromJson(Map<String, dynamic> json) {
  return _ShortsModel.fromJson(json);
}

/// @nodoc
mixin _$ShortsModel {
  String get creatorProfile => throw _privateConstructorUsedError;
  String get creatorName => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  VideoSource get videoSource => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  int get views => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this ShortsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShortsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShortsModelCopyWith<ShortsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortsModelCopyWith<$Res> {
  factory $ShortsModelCopyWith(
          ShortsModel value, $Res Function(ShortsModel) then) =
      _$ShortsModelCopyWithImpl<$Res, ShortsModel>;
  @useResult
  $Res call(
      {String creatorProfile,
      String creatorName,
      String videoUrl,
      VideoSource videoSource,
      String title,
      int likes,
      int views,
      String description});
}

/// @nodoc
class _$ShortsModelCopyWithImpl<$Res, $Val extends ShortsModel>
    implements $ShortsModelCopyWith<$Res> {
  _$ShortsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShortsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorProfile = null,
    Object? creatorName = null,
    Object? videoUrl = null,
    Object? videoSource = null,
    Object? title = null,
    Object? likes = null,
    Object? views = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      creatorProfile: null == creatorProfile
          ? _value.creatorProfile
          : creatorProfile // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      videoSource: null == videoSource
          ? _value.videoSource
          : videoSource // ignore: cast_nullable_to_non_nullable
              as VideoSource,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShortsModelImplCopyWith<$Res>
    implements $ShortsModelCopyWith<$Res> {
  factory _$$ShortsModelImplCopyWith(
          _$ShortsModelImpl value, $Res Function(_$ShortsModelImpl) then) =
      __$$ShortsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String creatorProfile,
      String creatorName,
      String videoUrl,
      VideoSource videoSource,
      String title,
      int likes,
      int views,
      String description});
}

/// @nodoc
class __$$ShortsModelImplCopyWithImpl<$Res>
    extends _$ShortsModelCopyWithImpl<$Res, _$ShortsModelImpl>
    implements _$$ShortsModelImplCopyWith<$Res> {
  __$$ShortsModelImplCopyWithImpl(
      _$ShortsModelImpl _value, $Res Function(_$ShortsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShortsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorProfile = null,
    Object? creatorName = null,
    Object? videoUrl = null,
    Object? videoSource = null,
    Object? title = null,
    Object? likes = null,
    Object? views = null,
    Object? description = null,
  }) {
    return _then(_$ShortsModelImpl(
      creatorProfile: null == creatorProfile
          ? _value.creatorProfile
          : creatorProfile // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      videoSource: null == videoSource
          ? _value.videoSource
          : videoSource // ignore: cast_nullable_to_non_nullable
              as VideoSource,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShortsModelImpl implements _ShortsModel {
  _$ShortsModelImpl(
      {required this.creatorProfile,
      required this.creatorName,
      required this.videoUrl,
      required this.videoSource,
      required this.title,
      required this.likes,
      required this.views,
      required this.description});

  factory _$ShortsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShortsModelImplFromJson(json);

  @override
  final String creatorProfile;
  @override
  final String creatorName;
  @override
  final String videoUrl;
  @override
  final VideoSource videoSource;
  @override
  final String title;
  @override
  final int likes;
  @override
  final int views;
  @override
  final String description;

  @override
  String toString() {
    return 'ShortsModel(creatorProfile: $creatorProfile, creatorName: $creatorName, videoUrl: $videoUrl, videoSource: $videoSource, title: $title, likes: $likes, views: $views, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShortsModelImpl &&
            (identical(other.creatorProfile, creatorProfile) ||
                other.creatorProfile == creatorProfile) &&
            (identical(other.creatorName, creatorName) ||
                other.creatorName == creatorName) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.videoSource, videoSource) ||
                other.videoSource == videoSource) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, creatorProfile, creatorName,
      videoUrl, videoSource, title, likes, views, description);

  /// Create a copy of ShortsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShortsModelImplCopyWith<_$ShortsModelImpl> get copyWith =>
      __$$ShortsModelImplCopyWithImpl<_$ShortsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShortsModelImplToJson(
      this,
    );
  }
}

abstract class _ShortsModel implements ShortsModel {
  factory _ShortsModel(
      {required final String creatorProfile,
      required final String creatorName,
      required final String videoUrl,
      required final VideoSource videoSource,
      required final String title,
      required final int likes,
      required final int views,
      required final String description}) = _$ShortsModelImpl;

  factory _ShortsModel.fromJson(Map<String, dynamic> json) =
      _$ShortsModelImpl.fromJson;

  @override
  String get creatorProfile;
  @override
  String get creatorName;
  @override
  String get videoUrl;
  @override
  VideoSource get videoSource;
  @override
  String get title;
  @override
  int get likes;
  @override
  int get views;
  @override
  String get description;

  /// Create a copy of ShortsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShortsModelImplCopyWith<_$ShortsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
