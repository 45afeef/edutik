import 'package:freezed_annotation/freezed_annotation.dart';

import '../../do/entities/batch_request.dart';

part 'batch_request_model.freezed.dart';
part 'batch_request_model.g.dart';

@freezed
class BatchRequestModel extends BatchRequestEntity with _$BatchRequestModel {
  factory BatchRequestModel({
    String? id,
    required String courseId,
    required String batchId,
    required String studentId,
    required BatchRequestStatus status,
  }) = _BatchRequestModel;

  factory BatchRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BatchRequestModelFromJson(json);
}
