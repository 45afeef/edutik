// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentModelImpl _$$AssessmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentModelImpl(
      name: json['name'] as String,
      type: $enumDecode(_$AssessmentTypeEnumMap, json['type']),
      items: (json['items'] as List<dynamic>)
          .map((e) => AssessmentItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AssessmentModelImplToJson(
        _$AssessmentModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$AssessmentTypeEnumMap[instance.type]!,
      'items': instance.items,
    };

const _$AssessmentTypeEnumMap = {
  AssessmentType.screening: 'screening',
  AssessmentType.diagnostic: 'diagnostic',
  AssessmentType.formative: 'formative',
  AssessmentType.summative: 'summative',
  AssessmentType.criterionReferenced: 'criterionReferenced',
  AssessmentType.normReferenced: 'normReferenced',
  AssessmentType.ipsative: 'ipsative',
};
