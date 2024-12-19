import '../assessment_item.dart';

class MatchTheFollowing extends ClosedEndedAssessmentItem {
  List<String> leftSideItems;
  List<String> rightSideItems;

  MatchTheFollowing({
    required super.question,
    required this.leftSideItems,
    required this.rightSideItems,
  }) : assert(leftSideItems.length == rightSideItems.length);
}
