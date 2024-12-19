part of 'assessment_model.dart';

AssessmentModel _$AssessmentFromJson(Map<String, dynamic> json) =>
    AssessmentModel(
      name: json['name'] as String,
      assessmentType: $enumDecode(_$AssessmentTypeEnumMap, json['type']),
      items: (json['items'] as List<dynamic>).map((e) {
        String type = e['type'];
        AssessmentItem item;
        switch (type) {
          case 'flashcard':
            item = _$FlashCardFromJson(e);
          case 'match_the_following':
            item = _$MatchTheFollowingFromJson(e);
          case 'mcq':
          case 'true_or_false':
            item = _$McqFromJson(e);
          case 'one_word_question':
          default:
            item = _$OneWordQuestionFromJson(e);
          // TODO - Add more cases
        }

        return item;
      }).toList(),
    );

const _$AssessmentTypeEnumMap = {
  AssessmentType.screening: 'screening',
  AssessmentType.diagnostic: 'diagnostic',
  AssessmentType.formative: 'formative',
  AssessmentType.summative: 'summative',
  AssessmentType.criterionReferenced: 'criterionReferenced',
  AssessmentType.normReferenced: 'normReferenced',
  AssessmentType.ipsative: 'ipsative',
};

// Here comes the json serialization of closed ended assessment types
// FLASH CARD
FlashCard _$FlashCardFromJson(Map<String, dynamic> json) =>
    FlashCard(question: json['question'], explanation: json['explanation']);

// MatchTheFollowing
MatchTheFollowing _$MatchTheFollowingFromJson(Map<String, dynamic> json) =>
    MatchTheFollowing(
      question: json['question'],
      leftSideItems: (json['leftSideItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rightSideItems: (json['rightSideItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

// MCQ
MCQ _$McqFromJson(Map<String, dynamic> json) => MCQ(
      question: json['question'],
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
    );

// OneWordQuestion
OneWordQuestion _$OneWordQuestionFromJson(Map<String, dynamic> json) =>
    OneWordQuestion(question: json['question']);
