import '../assessment_item.dart';

class MCQ extends ClosedEndedAssessmentItem {
  final List<String> options;

  MCQ({
    required super.question,
    required this.options,
  });
}

/// This class of MCQ is created from the inspiration from this pdf
/// https://www.schreyerinstitute.psu.edu/pdf/14RulesforWritingMultiple-ChoiceQuestions2009.pdf
/// 14 RULES FOR WRITING MULTIPLE-CHOICE QUESTIONS
/// look at the 3rd point
///
/// This type of question clearly measure the understanding,
/// not memory. - because memory is supplied along with question
class MemoryplusApplicationMCQ extends MCQ {
  MemoryplusApplicationMCQ({required super.question, required super.options});
}

