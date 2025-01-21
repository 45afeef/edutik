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
  Future<void> saveProfile(UserProfileModel profile) async {
    if (databaseService is FirebaseService) {
      try {
        await fetchProfile(profile.uid!);
      } on DatabaseException {
        // DatabaseException occurs when there is no document found with the id provided.
        // Which means that this is the first time user loggingIn - (in simple words - he just signedup right now)
        // Indicates that user have no document in the user collection
        return (databaseService as FirebaseService).setData(
          collection: _tableOrCollectionName,
          documentId: profile.uid!,
          data: profile.toJson(),
        );
      }
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
