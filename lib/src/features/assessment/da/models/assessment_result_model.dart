import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment_result_model.freezed.dart';
part 'assessment_result_model.g.dart';

@freezed
class AssessmentItemResponseModel with _$AssessmentItemResponseModel {
  factory AssessmentItemResponseModel({
    required int timeTakenInMillisecond,
    String? studentAnswer,
    String? currectAnswer,
  }) = _AssessmentItemResponseModel;

  factory AssessmentItemResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentItemResponseModelFromJson(json);
}

@freezed
class AssessmentResultModel with _$AssessmentResultModel {
  factory AssessmentResultModel({
    required Map<int, AssessmentItemResponseModel> studentResponse,
    required String assessmentId,
    required String studentId,
  }) = _AssessmentResultModel;

  factory AssessmentResultModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentResultModelFromJson(json);
}
