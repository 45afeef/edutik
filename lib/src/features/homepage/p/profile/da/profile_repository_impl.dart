import '../../../../../../utils/database/database_service.dart';
import '../../../../../../utils/database/firestore_service.dart';
import '../do/repository/profile_repo.dart';
import 'user_profile_model.dart';

const String _tableOrCollectionName = 'users';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final DatabaseService databaseService;

  UserProfileRepositoryImpl(this.databaseService);

  @override
  Future<void> deleteProfile(String uid) {
    // TODO: implement deleteProfile
    throw UnimplementedError();
  }

  @override
  Future<UserProfileModel> fetchProfile(String uid) async {
    Map<String, dynamic> data = await databaseService.getData(
        collection: _tableOrCollectionName, documentId: uid);

    return UserProfileModel.fromJson(data);
  }

  @override
  Future<void> saveProfile(UserProfileModel profile) {
    if (databaseService is FirebaseService) {
      return (databaseService as FirebaseService).setData(
          collection: _tableOrCollectionName,
          documentId: profile.uid!,
          data: profile.toJson());
    }

    return databaseService.addData(
        collection: _tableOrCollectionName, data: profile.toJson());
  }

  @override
  Future<void> updateProfile(String uid, UserProfileModel profile) {
    // TODO: implement saveProfile
    throw UnimplementedError();
  }
}
