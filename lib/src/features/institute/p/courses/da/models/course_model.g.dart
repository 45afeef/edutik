// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseModelImpl _$$CourseModelImplFromJson(Map<String, dynamic> json) =>
    _$CourseModelImpl(
      name: json['name'] as String,
      price: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
      syllabus:
          SyllabusModel.fromJson(json['syllabus'] as Map<String, dynamic>),
      videos:
          (json['videos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CourseModelImplToJson(_$CourseModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'syllabus': instance.syllabus,
      'videos': instance.videos,
    };
