import '../../../../../../utils/database/database_service.dart';
import '../../../../../../utils/database/firestore_service.dart';
import '../../../do/content.dart';
import '../do/repository/profile_repo.dart';
import 'user_profile_model.dart';

const String _tableOrCollectionName = 'users';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final DatabaseService databaseService;

  UserProfileRepositoryImpl(this.databaseService);

  @override
  Future<void> create(UserProfileModel profile) async {
    if (databaseService is FirebaseService) {
      try {
        await readOne(profile.uid!);
      } on DatabaseException {
        // DatabaseException occurs when there is no document found with the id provided.
        // Which means that this is the first time user loggingIn - (in simple words - he just signedup right now)
        // Indicates that user have no document in the user collection

        // This is a wierd way!
        // We are really expecting and exception.
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
  Future<void> delete(String ownerId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<UserProfileModel>> readAll(String ownerId,
      {UserType? ownerType}) {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  Future<UserProfileModel> readOne(String userId, {UserType? ownerType}) async {
    Map<String, dynamic> data = await databaseService.getData(
        collection: _tableOrCollectionName, documentId: userId);

    return UserProfileModel.fromJson(data);
  }

  @override
  Future<void> update(String userId, profile) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
