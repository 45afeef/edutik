import '../../../../../../utils/database/database_service.dart';
import '../do/repository/profile_repo.dart';
import 'user_profile_model.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final DatabaseService databaseService;

  UserProfileRepositoryImpl(this.databaseService);

  @override
  Future<void> deleteProfile(String id) {
    // TODO: implement deleteProfile
    throw UnimplementedError();
  }

  @override
  Future<UserProfileModel> fetchProfile(String uid) async {
    Map<String, dynamic> data =
        await databaseService.getData(collection: 'users', documentId: uid);

    return UserProfileModel.fromJson(data);
  }

  @override
  Future<void> saveProfile(UserProfileModel userProfile) {
    // TODO: implement saveProfile
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfile(String id, UserProfileModel profile) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
