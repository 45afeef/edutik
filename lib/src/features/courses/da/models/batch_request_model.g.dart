// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BatchRequestModelImpl _$$BatchRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BatchRequestModelImpl(
      id: json['id']?.toString(),
      courseId: json['courseId'] as String,
      batchId: json['batchId'] as String,
      studentId: json['studentId'] as String,
      studentName: json['studentName'] as String?,
      status: $enumDecode(_$BatchRequestStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$BatchRequestModelImplToJson(
        _$BatchRequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'batchId': instance.batchId,
      'studentId': instance.studentId,
      'studentName': instance.studentName,
      'status': _$BatchRequestStatusEnumMap[instance.status]!,
    };

const _$BatchRequestStatusEnumMap = {
  BatchRequestStatus.pending: 'pending',
  BatchRequestStatus.accepted: 'accepted',
  BatchRequestStatus.rejected: 'rejected',
  BatchRequestStatus.none: 'none',
};
