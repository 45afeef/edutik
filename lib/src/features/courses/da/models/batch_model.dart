import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../homepage/p/profile/da/user_profile_model.dart';
import '../../do/entities/batch.dart';
import 'course_model.dart';
import 'syllabus/resource_model.dart';

part 'batch_model.freezed.dart';
part 'batch_model.g.dart';

@freezed
class BatchModel extends BatchEntity with _$BatchModel {
  factory BatchModel({
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
  }) = _BatchModel;

  factory BatchModel.fromJson(Map<String, dynamic> json) =>
      _$BatchModelFromJson(json);
}
