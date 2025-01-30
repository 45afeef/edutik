import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../do/entities/syllabus/syllubus.dart';
import 'module_model.dart';

part 'syllabus_model.freezed.dart';
part 'syllabus_model.g.dart';

@freezed
class SyllabusModel extends Syllabus with _$SyllabusModel {
  factory SyllabusModel({
    required String id,
    required String title,
    required String description,
    required String academicLevel,
    required String language,
    required Duration duration,
    required String createdBy,
    required DateTime updatedAt,
    required List<ModuleModel> modules,
  }) = _SyllabusModel;

  factory SyllabusModel.fromJson(Map<String, dynamic> json) =>
      _$SyllabusModelFromJson(json);
}
