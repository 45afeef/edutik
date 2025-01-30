// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syllabus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyllabusModelImpl _$$SyllabusModelImplFromJson(Map<String, dynamic> json) =>
    _$SyllabusModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      academicLevel: json['academicLevel'] as String,
      language: json['language'] as String,
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      createdBy: json['createdBy'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      modules: (json['modules'] as List<dynamic>)
          .map((e) => ModuleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SyllabusModelImplToJson(_$SyllabusModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'academicLevel': instance.academicLevel,
      'language': instance.language,
      'duration': instance.duration.inMicroseconds,
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'modules': instance.modules,
    };
