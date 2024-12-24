import 'package:freezed_annotation/freezed_annotation.dart';

import '../../do/assessment.dart';
import 'assessment_item.dart';

part 'assessment_model.freezed.dart';
part 'assessment_model.g.dart';

@freezed
class AssessmentModel extends Assessment with _$AssessmentModel {
  const factory AssessmentModel({
    required String name,
    required AssessmentType type,
    required List<AssessmentItemModel> items,
  }) = _AssessmentModel;

  factory AssessmentModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentModelFromJson(json);
}


