// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModuleModelImpl _$$ModuleModelImplFromJson(Map<String, dynamic> json) =>
    _$ModuleModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      units: (json['units'] as List<dynamic>)
          .map((e) => UnitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ModuleModelImplToJson(_$ModuleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration.inMicroseconds,
      'units': instance.units,
    };
