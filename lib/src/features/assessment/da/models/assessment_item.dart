import 'package:freezed_annotation/freezed_annotation.dart';

import '../../do/assessment_item.dart';

part 'assessment_item.freezed.dart';
part 'assessment_item.g.dart';

@freezed
class AssessmentItemModel extends AssessmentItem with _$AssessmentItemModel {
  factory AssessmentItemModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentItemModelFromJson(json);

  // const factory AssessmentItemModel.matchTheFollowing({
  //   required String question,
  //   required Map<String, String> pairs,
  // }) = _$MatchTheFollowing;

  const factory AssessmentItemModel.mcq({
    required String question,
    required List<String> options,
    required int correctOption,
  }) = _$MCQ;

  // const factory AssessmentItemModel.singleWord({
  //   required String question,
  //   required String correctAnswer,
  // }) = _$SingleWord;

  // const factory AssessmentItemModel.trueFalse({
  //   required String question,
  //   required bool correctAnswer,
  // }) = _$TrueFalse;
}
