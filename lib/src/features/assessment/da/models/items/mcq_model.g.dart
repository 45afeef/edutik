// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mcq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$McqModelImpl _$$McqModelImplFromJson(Map<String, dynamic> json) =>
    _$McqModelImpl(
      question: json['question'] as String,
      answer: json['answer'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$McqModelImplToJson(_$McqModelImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'options': instance.options,
    };
