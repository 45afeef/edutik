/// TODO - Need to measure the effectiveness of the assessment item
/// http://www.schreyerinstitute.psu.edu/pdf/GuideToItemAnalysis.pdf
abstract class AssessmentItem {
  final String question;

  AssessmentItem({required this.question});
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

  void addCurrectAnswer(String answer) {
    currectAnswer = answer;
  }

  void incrementTimeTaken(int increment) {
    timeTakenInMillisecond += increment;
  }

  void updateResponse(String response) {
    studentAnswer = response;
  }
}

abstract class ClosedEndedAssessmentItem extends AssessmentItem {
  final String answer;

  ClosedEndedAssessmentItem({
    required super.question,
    required this.answer,
  });
}

abstract class OpenEndedAssessmentItem extends AssessmentItem {
  OpenEndedAssessmentItem({required super.question});
}
