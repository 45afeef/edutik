import 'package:freezed_annotation/freezed_annotation.dart';

import '../../do/entities/course.dart';
import 'price_model.dart';
import 'syllabus/syllabus_model.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
class CourseModel extends Course with _$CourseModel {
  factory CourseModel({
    required String name,
    required PriceModel price,
    required SyllabusModel syllabus,
    required List<String> videos,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
}
