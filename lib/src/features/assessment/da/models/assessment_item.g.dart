// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$MCQImpl _$$$MCQImplFromJson(Map<String, dynamic> json) => _$$MCQImpl(
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      correctOption: (json['correctOption'] as num).toInt(),
    );

Map<String, dynamic> _$$$MCQImplToJson(_$$MCQImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'options': instance.options,
      'correctOption': instance.correctOption,
    };
