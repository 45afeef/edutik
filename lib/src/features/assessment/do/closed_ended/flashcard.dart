import '../assessment_item.dart';

// TODO - Complete the FlashCard
class FlashCard extends ClosedEndedAssessmentItem {
  String explanation;

  FlashCard({
    required super.question,
    required this.explanation,
  });
}
