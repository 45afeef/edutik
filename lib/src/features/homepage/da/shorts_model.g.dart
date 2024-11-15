// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShortsModelImpl _$$ShortsModelImplFromJson(Map<String, dynamic> json) =>
    _$ShortsModelImpl(
      creatorProfile: json['creatorProfile'] as String,
      creatorName: json['creatorName'] as String,
      videoUrl: json['videoUrl'] as String,
      videoSource: $enumDecode(_$VideoSourceEnumMap, json['videoSource']),
      title: json['title'] as String,
      likes: (json['likes'] as num).toInt(),
      views: (json['views'] as num).toInt(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ShortsModelImplToJson(_$ShortsModelImpl instance) =>
    <String, dynamic>{
      'creatorProfile': instance.creatorProfile,
      'creatorName': instance.creatorName,
      'videoUrl': instance.videoUrl,
      'videoSource': _$VideoSourceEnumMap[instance.videoSource]!,
      'title': instance.title,
      'likes': instance.likes,
      'views': instance.views,
      'description': instance.description,
    };

const _$VideoSourceEnumMap = {
  VideoSource.youTube: 'youTube',
  VideoSource.instagram: 'instagram',
  VideoSource.facebook: 'facebook',
  VideoSource.network: 'network',
};
