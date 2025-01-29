// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResourceModelImpl _$$ResourceModelImplFromJson(Map<String, dynamic> json) =>
    _$ResourceModelImpl(
      id: json['id'] as String,
      type: $enumDecode(_$ResourceTypeEnumMap, json['type']),
      title: json['title'] as String,
      url: Uri.parse(json['url'] as String),
    );

Map<String, dynamic> _$$ResourceModelImplToJson(_$ResourceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ResourceTypeEnumMap[instance.type]!,
      'title': instance.title,
      'url': instance.url.toString(),
    };

const _$ResourceTypeEnumMap = {
  ResourceType.video: 'video',
  ResourceType.pdf: 'pdf',
  ResourceType.link: 'link',
  ResourceType.plainText: 'plainText',
  ResourceType.richText: 'richText',
};
