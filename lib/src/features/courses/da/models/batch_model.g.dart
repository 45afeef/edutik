// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BatchModelImpl _$$BatchModelImplFromJson(Map<String, dynamic> json) =>
    _$BatchModelImpl(
      courseId: json['courseId'] as String,
      name: json['name'] as String,
      startDate: (json['startDate'] as num).toInt(),
      endDate: (json['endDate'] as num).toInt(),
      students: (json['students'] as List<dynamic>)
          .map((e) => UserProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teachers: (json['teachers'] as List<dynamic>)
          .map((e) => UserProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      mentors: (json['mentors'] as List<dynamic>?)
          ?.map((e) => UserProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: json['events'] as List<dynamic>?,
      achivements: json['achivements'] as List<dynamic>?,
      assessments: (json['assessments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      meterials: (json['meterials'] as List<dynamic>?)
          ?.map((e) => ResourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BatchModelImplToJson(_$BatchModelImpl instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'name': instance.name,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'students': instance.students,
      'teachers': instance.teachers,
      'mentors': instance.mentors,
      'events': instance.events,
      'achivements': instance.achivements,
      'assessments': instance.assessments,
      'meterials': instance.meterials,
    };
