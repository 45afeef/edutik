import 'package:freezed_annotation/freezed_annotation.dart';

import '../../do/entities/batch_request.dart';

part 'batch_request_model.freezed.dart';
part 'batch_request_model.g.dart';

@unfreezed
class BatchRequestModel extends BatchRequestEntity with _$BatchRequestModel {
  factory BatchRequestModel({
    final String? id,
    required final String courseId,
    required final String batchId,
    required final String studentId,
    final String? studentName, // Added studentName
    required BatchRequestStatus status,
  }) = _BatchRequestModel;

  factory BatchRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BatchRequestModelFromJson(json);
}
