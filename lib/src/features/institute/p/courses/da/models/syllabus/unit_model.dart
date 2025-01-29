import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../do/entities/syllabus/unit.dart';
import 'lesson_model.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

@freezed
class UnitModel extends Unit with _$UnitModel {
  factory UnitModel({
    required String id,
    required String name,
    required String description,
    required Duration duration,
    required List<LessonModel> lessons,
  }) = _UnitModel;

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);
}
