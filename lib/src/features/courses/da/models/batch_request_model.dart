import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../homepage/p/profile/da/user_profile_model.dart';
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

// Add a custom converter for BatchRequestStatus
class BatchRequestStatusConverter
    implements JsonConverter<BatchRequestStatus, String> {
  const BatchRequestStatusConverter();

  @override
  BatchRequestStatus fromJson(String json) {
    switch (json) {
      case 'pending':
        return BatchRequestStatus.pending;
      case 'accepted':
        return BatchRequestStatus.accepted;
      case 'rejected':
        return BatchRequestStatus.rejected;
      default:
        throw ArgumentError('Unknown BatchRequestStatus: $json');
    }
  }

  @override
  String toJson(BatchRequestStatus status) {
    return status.toString().split('.').last;
  }
}
