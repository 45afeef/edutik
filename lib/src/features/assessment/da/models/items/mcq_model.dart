import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../do/closed_ended/mcq.dart';

part 'mcq_model.freezed.dart';
part 'mcq_model.g.dart';

@freezed
class McqModel extends MCQ with _$McqModel {
   factory McqModel({
    required String question,
    required List<String> options,
  }) = _McqModel;

  factory McqModel.fromJson(Map<String, dynamic> json) =>
      _$McqModelFromJson(json);
}
