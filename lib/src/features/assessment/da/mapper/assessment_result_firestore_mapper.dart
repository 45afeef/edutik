import '../../do/assessment.dart';
import '../../do/assessment_item.dart';
import '../models/assessment_result_model.dart';

class AssessmentResultMapper {
  // Converts AssessmentResult (domain entity) into an AssessmentResultModel (Firestore data)
  static AssessmentResultModel fromEntity(AssessmentResult entity) {
    final studentResponse = entity.studentResponse.map(
      (key, response) => MapEntry(
        key,
        AssessmentItemResponseModel(
          timeTakenInMillisecond: response.timeTakenInMillisecond,
          studentAnswer: response.studentAnswer,
          currectAnswer: response.currectAnswer,
        ),
      ),
    );

    return AssessmentResultModel(
      assessmentId: entity.assessmentId!,
      studentId: entity.studentId!,
      studentResponse: studentResponse,
      utmSource: entity.utmSource,
      campaign: entity.campaign,
      scoredMark: entity.scoredMark,
      studentName: entity.studentName,
    );
  }

  // Converts AssessmentResultModel (Firestore data) into an AssessmentResult (domain entity)
  static AssessmentResult toEntity(AssessmentResultModel model) {
    final convertedMap = <int, AssessmentItemResponse>{};
    model.studentResponse.forEach((key, result) {
      convertedMap[key] = AssessmentItemResponse(
        timeTakenInMillisecond: result.timeTakenInMillisecond,
        studentAnswer: result.studentAnswer,
        currectAnswer: result.currectAnswer,
      );
    });

    return AssessmentResult(
      assessmentId: model.assessmentId,
      studentId: model.studentId,
      initialResponse: convertedMap,
      utmSource: model.utmSource,
      campaign: model.campaign,
      scoredMark: model.scoredMark,
      studentName: model.studentName, 
    );
  }
}
