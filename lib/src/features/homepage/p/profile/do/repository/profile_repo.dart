import '../../da/user_profile_model.dart';

abstract class UserProfileRepository {
  Future<void> deleteProfile(String id);
  Future<UserProfileModel> fetchProfile(String uid);
  Future<void> saveProfile(UserProfileModel userProfile);
  Future<void> updateProfile(String id, UserProfileModel profile);
}
