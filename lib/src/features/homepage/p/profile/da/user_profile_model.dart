import 'package:freezed_annotation/freezed_annotation.dart';

import '../do/entity/user_profile.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel extends UserProfile with _$UserProfileModel {
  factory UserProfileModel({
    required String displayName,
    required String photoURL,
    required String email,
  }) = _UserProfileModel;

  // A factory constructor that initializes an instance from a JSON map.
  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}
