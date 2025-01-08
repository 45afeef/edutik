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
    );

Map<String, dynamic> _$$InstituteModelImplToJson(
        _$InstituteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'profile_image': instance.profileUrl,
    };
