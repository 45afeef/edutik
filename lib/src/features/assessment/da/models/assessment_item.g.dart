// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$MCQImpl _$$$MCQImplFromJson(Map<String, dynamic> json) => _$$MCQImpl(
      question: json['question'] as String,
      answer: json['answer'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$$MCQImplToJson(_$$MCQImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'options': instance.options,
    };
