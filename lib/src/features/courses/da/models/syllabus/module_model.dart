import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../do/entities/syllabus/module.dart';
import 'unit_model.dart';

part 'module_model.freezed.dart';
part 'module_model.g.dart';

@freezed
class ModuleModel extends Module with _$ModuleModel {
  factory ModuleModel({
    required String id,
    required String name,
    required String description,
    required Duration duration,
    required List<UnitModel> units,
  }) = _ModuleModel;

  factory ModuleModel.fromJson(Map<String, dynamic> json) =>
      _$ModuleModelFromJson(json);
}
