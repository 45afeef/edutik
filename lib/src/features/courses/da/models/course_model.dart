import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../homepage/do/content.dart';
import '../../do/entities/course.dart';
import 'price_model.dart';
import 'syllabus/syllabus_model.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
class CourseModel extends Course with _$CourseModel {
  factory CourseModel({
    String? id,
    required String name,
    required PriceModel price,
    SyllabusModel? syllabus,
    required String bannerImageUri,
    required String creatorName,
    required String creatorRef,
    required String ownerName,
    required String ownerRef,
    required UserType creatorType,
    required UserType ownerType,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
}
