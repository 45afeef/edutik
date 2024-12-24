
import 'assessment_item.dart';

enum AssessmentType {
  /// [screening] assessment is used as pre lesson assessment. Used for screening the student
  ///  before admission
  screening,

  /// This type of assessement is used to identify what is the student's level of knowledge.
  /// The result of [diagnostic] assessment test is used to move the student between levels
  /// after they started learing. This is usally done before the starting of learning. but
  /// we(Parayada) engourages to take at any time and many times
  diagnostic,

  /// This type of assessment is ongoing and used to monitor student learning during the
  /// instructional process. It provides immediate feedback to both teachers and students, helping
  /// identify strengths and areas for improvement. Examples include quizzes, class discussions,
  /// and exit tickets.
  formative,

  /// These are typically administered at the end of a learning period, such as a semester
  /// or school year, to evaluate what students have learned. They measure a student’s mastery
  /// of the curriculum and often contribute to their final grade2.
  summative,

  /// Measures a student’s performance against a fixed set of criteria or learning standards.
  criterionReferenced,

  /// Measures a student’s performance against all other students. uses percentile as measure.
  normReferenced,

  /// [ipsative] Compares a student’s current performance against their previous performances.
  ipsative,
}

class Assessment {
  final String name;
  final AssessmentType type;
  final List<AssessmentItem> items;

  Assessment({
    required this.name,
    required this.type,
    required this.items,
  });

  factory Assessment.empty() =>
      Assessment(name: '', type: AssessmentType.ipsative, items: [],);
}

class AssessmentResult {
  Map<int, AssessmentItemResponse> studentResponse;

  // Constructor
  AssessmentResult({Map<int, AssessmentItemResponse>? initialResponse})
      : studentResponse = initialResponse ?? {};

  // Methods
  void setItemResponse(int index, AssessmentItemResponse response) =>
      studentResponse[index] = response;

  AssessmentItemResponse? getItemResponse(int index) => studentResponse[index];
}

/// Assessments are mainly conduts for many reasons. I'm listing some of the core
/// reasons
///
/// 1. Identifying Mistakes
/// 2. Identifying Knowlege and Knowlege Gaps
/// 3. Identifying Confusions
/// 4. Identifying Misconceptions
/// 5. Measuring Mastery levels
/// 6. Predicting future performance
/// 7. Feedback for learning imporvements
/// 8. Validating teaching Methods
/// 9. Motivation and Accountability
/// 10. Curriculum Alignment

// SINGLE result object can create following analysis
// encouraging, suggesting areas for improvement
// Analyze the correctness of each assessment item
// Calculate the time taken to complete the assessment
//   Identify unusually fast or slow responses. Longer times may indicate confusion or careful consideration.
// Feedback Generation:
//       Based on the above analyses, generate personalized feedback:
//           Encourage strengths.
//           Suggest targeted study areas.
//           Address misconceptions or knowledge gaps.
class AssessmentResultAnalysis {}

// for a experienced and passioned teacher, its easy to measure this outcomes, but i'm designing a computer software. for now the only input is assessment. so how can i understand whether it is a mistake, misconception, confusion, knowledge gap, guessing, or others using algorithms
// Copilot
// Designing algorithms to infer student outcomes from assessment data is a fascinating challenge! While it’s not straightforward, I can offer some approaches to consider:

// Pattern Recognition:
// Analyze patterns in student responses. For example:
// Frequent incorrect answers may indicate a mistake.
// Consistent misconceptions (e.g., misunderstanding a concept) suggest a misconception.
// Random or inconsistent answers might be guessing.
// Machine learning techniques (e.g., clustering, decision trees) can help identify these patterns.
// Item Difficulty and Discrimination:
// Assess each item’s difficulty (how many students answered correctly) and discrimination (how well it separates high- and low-performing students).
// Items with low discrimination may cause confusion or reveal knowledge gaps.
// Response Time Analysis:
// Longer response times may indicate confusion or knowledge gaps.
// Rapid answers might be guessing.
// Compare response times across items.
// Semantic Analysis:
// Use natural language processing (NLP) to analyze open-ended responses.
// Look for keywords related to misconceptions or gaps.
// Bayesian Networks:
// Model relationships between student outcomes (e.g., correctness, time taken) and potential causes (e.g., misconceptions).
// Bayesian networks can handle uncertainty and dependencies.
// Feedback Loop:
// Collect additional data over time.
// Refine algorithms based on teacher feedback and real-world observations.
// Remember that no single algorithm will perfectly classify outcomes, especially without additional context. Combining multiple approaches and iterating based on real-world data is essential. 🤖📊
