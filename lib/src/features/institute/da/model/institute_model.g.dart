// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstituteModelImpl _$$InstituteModelImplFromJson(Map<String, dynamic> json) =>
    _$InstituteModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      address: json['address'] as String,
      profileUrl: json['profile_image'] as String,
      publicAssessmentRefs: (json['publicAssessmentRefs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      editors:
          (json['editors'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$InstituteModelImplToJson(
        _$InstituteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'profile_image': instance.profileUrl,
      'publicAssessmentRefs': instance.publicAssessmentRefs,
      'editors': instance.editors,
    };
