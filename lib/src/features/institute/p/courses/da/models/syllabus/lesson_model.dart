import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../do/entities/syllabus/lesson.dart';
import 'resource_model.dart';

part 'lesson_model.freezed.dart';
part 'lesson_model.g.dart';

@freezed
class LessonModel extends Lesson with _$LessonModel {
  factory LessonModel({
    required String id,
    required String title,
    required String content,
    required Duration duration,
    required List<ResourceModel> resources,
  }) = _LessonModel;

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);
}
