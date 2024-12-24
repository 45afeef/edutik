

/// TODO - Need to measure the effectiveness of the assessment item
/// http://www.schreyerinstitute.psu.edu/pdf/GuideToItemAnalysis.pdf
abstract class AssessmentItem {
  final String question;

  AssessmentItem({required this.question});
}

abstract class ClosedEndedAssessmentItem extends AssessmentItem {
  ClosedEndedAssessmentItem({required super.question});
}

abstract class OpenEndedAssessmentItem extends AssessmentItem {
  OpenEndedAssessmentItem({required super.question});
}

/// This class [AssessmentItemResponse] is a common result class for all [AssessmentItem]s
/// We assume [currectAnswer] only usefull and avaialble for [ClosedEndedAssessmentItem]
class AssessmentItemResponse {
  int timeTakenInMillisecond;
  String? studentAnswer;
  String? currectAnswer;

  AssessmentItemResponse({
    required this.timeTakenInMillisecond,
    this.studentAnswer,
    this.currectAnswer,
  });

  void incrementTimeTaken(int increment) {
    timeTakenInMillisecond += increment;
  }

  void updateResponse(String response) {
    studentAnswer = response.toString();
  }
}
