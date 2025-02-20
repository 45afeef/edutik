// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseModelImpl _$$CourseModelImplFromJson(Map<String, dynamic> json) =>
    _$CourseModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      price: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
      syllabus: json['syllabus'] == null
          ? null
          : SyllabusModel.fromJson(json['syllabus'] as Map<String, dynamic>),
      bannerImageUri: json['bannerImageUri'] as String,
      creatorName: json['creatorName'] as String,
      creatorRef: json['creatorRef'] as String,
      ownerName: json['ownerName'] as String,
      ownerRef: json['ownerRef'] as String,
      creatorType: $enumDecode(_$UserTypeEnumMap, json['creatorType']),
      ownerType: $enumDecode(_$UserTypeEnumMap, json['ownerType']),
    );

Map<String, dynamic> _$$CourseModelImplToJson(_$CourseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price.toJson(),
      'syllabus': instance.syllabus?.toJson(),
      'bannerImageUri': instance.bannerImageUri,
      'creatorName': instance.creatorName,
      'creatorRef': instance.creatorRef,
      'ownerName': instance.ownerName,
      'ownerRef': instance.ownerRef,
      'creatorType': _$UserTypeEnumMap[instance.creatorType]!,
      'ownerType': _$UserTypeEnumMap[instance.ownerType]!,
    };

const _$UserTypeEnumMap = {
  UserType.institute: 'institute',
  UserType.user: 'user',
};
