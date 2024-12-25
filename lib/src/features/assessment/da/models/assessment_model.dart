import 'package:freezed_annotation/freezed_annotation.dart';

import '../../do/assessment.dart';
import '../../do/assessment_item.dart';
import '../../do/closed_ended/flashcard.dart';
import '../../do/closed_ended/match_the_following.dart';
import '../../do/closed_ended/mcq.dart';
import '../../do/open_ended/one_word.dart';

part 'assessment_model.g.dart';

@freezed
class AssessmentModel extends Assessment {
  AssessmentModel({
    super.id,
    required super.name,
    required super.type,
    required super.items,
  });

  factory AssessmentModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFromJson(json);

  Map<String, dynamic> toJson() => _$AssessmentModelToJson(this);
}
