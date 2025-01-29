import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../do/entities/syllabus/resource.dart';

part 'resource_model.freezed.dart';
part 'resource_model.g.dart';

@freezed
class ResourceModel extends Resource with _$ResourceModel {
  factory ResourceModel({
    required String id,
    required ResourceType type,
    required String title,
    required Uri url,
  }) = _ResourceModel;

  factory ResourceModel.fromJson(Map<String, dynamic> json) =>
      _$ResourceModelFromJson(json);
}
