import 'package:freezed_annotation/freezed_annotation.dart';

import '../do/shorts_entity.dart';

part 'shorts_model.freezed.dart';
part 'shorts_model.g.dart';

@freezed
class ShortsModel extends ShortsEntity with _$ShortsModel {
  factory ShortsModel({
    required String creatorProfile,
    required String creatorName,
    required String videoUrl,
    required VideoSource videoSource,
    required String title,
    required int likes,
    required int views,
    required String description,
  }) = _ShortsModel;

  // A factory constructor that initializes an instance from a JSON map.
  factory ShortsModel.fromJson(Map<String, dynamic> json) =>
      _$ShortsModelFromJson(json);
}
