// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_model.dart';

const _$AssessmentTypeEnumMap = {
  AssessmentType.screening: 'screening',
  AssessmentType.diagnostic: 'diagnostic',
  AssessmentType.formative: 'formative',
  AssessmentType.summative: 'summative',
  AssessmentType.criterionReferenced: 'criterionReferenced',
  AssessmentType.normReferenced: 'normReferenced',
  AssessmentType.ipsative: 'ipsative',
};

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentModel _$AssessmentFromJson(Map<String, dynamic> json) =>
    AssessmentModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      type: $enumDecode(_$AssessmentTypeEnumMap, json['type']),
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
      creatorName: json['creatorName'] as String,
      creatorRef: json['creatorRef'] as String,
      ownerName: json['ownerName'] as String,
      ownerRef: json['ownerRef'] as String,
    );

// Complete the `toJson` method for `AssessmentModel`
Map<String, dynamic> _$AssessmentModelToJson(Assessment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$AssessmentTypeEnumMap[instance.type]!,
      'items': instance.items.map((item) {
        switch (item.runtimeType) {
          case const (FlashCard):
            return _$FlashCardToJson(item as FlashCard);
          case const (MatchTheFollowing):
            return _$MatchTheFollowingToJson(item as MatchTheFollowing);
          case const (MCQ):
            return _$McqToJson(item as MCQ);
          case const (OneWordQuestion):
            return _$OneWordQuestionToJson(item as OneWordQuestion);
          // TODO: Add more cases for other assessment item types
          default:
            throw Exception('Unknown assessment item type');
        }
      }).toList(),
      'creatorName': instance.creatorName,
      'creatorRef': instance.creatorRef,
      'ownerName': instance.ownerName,
      'ownerRef': instance.ownerRef,
    };

// Here comes the json serialization of closed ended assessment types
// FLASH CARD
FlashCard _$FlashCardFromJson(Map<String, dynamic> json) => FlashCard(
      question: json['question'],
      answer: json['answer'],
      explanation: json['explanation'],
    );

// FLASH CARD
Map<String, dynamic> _$FlashCardToJson(FlashCard instance) => <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'explanation': instance.explanation,
      'type': 'flashcard',
    };

// MatchTheFollowing
MatchTheFollowing _$MatchTheFollowingFromJson(Map<String, dynamic> json) =>
    MatchTheFollowing(
      question: json['question'],
      answer: json['answer'],
      leftSideItems: (json['leftSideItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rightSideItems: (json['rightSideItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

// MatchTheFollowing
Map<String, dynamic> _$MatchTheFollowingToJson(MatchTheFollowing instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'leftSideItems': instance.leftSideItems,
      'rightSideItems': instance.rightSideItems,
      'type': 'match_the_following',
    };

// MCQ
MCQ _$McqFromJson(Map<String, dynamic> json) => MCQ(
      question: json['question'],
      answer: json['answer'],
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
    );

// MCQ
Map<String, dynamic> _$McqToJson(MCQ instance) => <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'options': instance.options,
      'type': 'mcq',
    };

// OneWordQuestion
OneWordQuestion _$OneWordQuestionFromJson(Map<String, dynamic> json) =>
    OneWordQuestion(question: json['question']);

// OneWordQuestion
Map<String, dynamic> _$OneWordQuestionToJson(OneWordQuestion instance) =>
    <String, dynamic>{
      'question': instance.question,
      'type': 'one_word_question',
    };
