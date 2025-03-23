// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentItemResponseModelImpl _$$AssessmentItemResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentItemResponseModelImpl(
      timeTakenInMillisecond: (json['timeTakenInMillisecond'] as num).toInt(),
      studentAnswer: json['studentAnswer'] as String?,
      currectAnswer: json['currectAnswer'] as String?,
    );

Map<String, dynamic> _$$AssessmentItemResponseModelImplToJson(
        _$AssessmentItemResponseModelImpl instance) =>
    <String, dynamic>{
      'timeTakenInMillisecond': instance.timeTakenInMillisecond,
      'studentAnswer': instance.studentAnswer,
      'currectAnswer': instance.currectAnswer,
    };

_$AssessmentResultModelImpl _$$AssessmentResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentResultModelImpl(
      studentResponse: (json['studentResponse'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k),
            AssessmentItemResponseModel.fromJson(e as Map<String, dynamic>)),
      ),
      assessmentId: json['assessmentId'] as String,
      studentId: json['studentId'] as String,
    );

Map<String, dynamic> _$$AssessmentResultModelImplToJson(
        _$AssessmentResultModelImpl instance) =>
    <String, dynamic>{
      'studentResponse': instance.studentResponse
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
      'assessmentId': instance.assessmentId,
      'studentId': instance.studentId,
    };
