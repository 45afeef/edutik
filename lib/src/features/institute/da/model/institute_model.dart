import 'package:freezed_annotation/freezed_annotation.dart';

import '../../do/entity/institute.dart';

part 'institute_model.freezed.dart';
part 'institute_model.g.dart';

@freezed
class InstituteModel extends Institute with _$InstituteModel {
  factory InstituteModel({
    String? id,
    required String name,
    required String address,
    @JsonKey(name: 'profile_image') required String profileUrl,
  }) = _InstituteModel;

  factory InstituteModel.fromJson(Map<String, dynamic> json) =>
      _$InstituteModelFromJson(json);
}
