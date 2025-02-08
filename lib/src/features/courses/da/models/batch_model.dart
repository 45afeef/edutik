import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../homepage/p/profile/da/user_profile_model.dart';
import '../../do/entities/batch.dart';
import 'syllabus/resource_model.dart';

part 'batch_model.freezed.dart';
part 'batch_model.g.dart';

@freezed
class BatchModel extends BatchEntity with _$BatchModel {
  factory BatchModel({
    String? id,
    required String courseId,
    required String name,
    required int startDate,
    required int endDate,
    required List<UserProfileModel> students,
    required List<UserProfileModel> teachers,
    List<UserProfileModel>? mentors,
    List<dynamic>? events,
    List<dynamic>? achivements,
    List<String>? assessments,
    List<ResourceModel>? meterials,
    required BatchStatus status,
  }) = _BatchModel;

  factory BatchModel.fromJson(Map<String, dynamic> json) =>
      _$BatchModelFromJson(json);
}

// Add a custom converter for BatchStatus
class BatchStatusConverter implements JsonConverter<BatchStatus, String> {
  const BatchStatusConverter();

  @override
  BatchStatus fromJson(String json) {
    switch (json) {
      case 'active':
        return BatchStatus.active;
      case 'archived':
        return BatchStatus.archived;
      default:
        throw ArgumentError('Unknown BatchStatus: $json');
    }
  }

  @override
  String toJson(BatchStatus status) {
    return status.toString().split('.').last;
  }
}
