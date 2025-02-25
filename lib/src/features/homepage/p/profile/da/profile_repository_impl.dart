import '../../../../../../utils/database/database_service.dart';
import '../../../../../../utils/database/firestore_service.dart';
import '../../../do/content.dart';
import '../do/repository/profile_repo.dart';
import 'user_profile_model.dart';

const String _tableOrCollectionName = 'users';

/// Implementation of the [UserProfileRepository] interface
/// for managing user profiles in the database.
class UserProfileRepositoryImpl implements UserProfileRepository {
  final DatabaseService databaseService;

  UserProfileRepositoryImpl(this.databaseService);

  /// Creates a new user profile in the database.
  /// If the profile already exists, it updates the existing profile.
  @override
  Future<void> create(UserProfileModel profile) async {
    if (databaseService is FirebaseService) {
      try {
        // Check if the profile already exists
        await readOne(profile.uid!);
        // If it exists, update the profile
        await update(profile.uid!, profile.toJson());
      } on DatabaseException {
        // If it does not exist, create a new profile
        await (databaseService as FirebaseService).setData(
          collection: _tableOrCollectionName,
          documentId: profile.uid!,
          data: profile.toJson(),
        );
      }
    } else {
      // For other database services, check if the profile exists
      try {
        await readOne(profile.uid!);
        await update(profile.uid!, profile.toJson());
      } catch (e) {
        await databaseService.addData(
          collection: _tableOrCollectionName,
          data: profile.toJson(),
        );
      }
      throw UnimplementedError('Database service not implemented fully');
    }
  }

  /// Deletes a user profile from the database.
  @override
  Future<void> delete(String ownerId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  /// Reads all user profiles from the database.
  @override
  Future<List<UserProfileModel>> readAll(String ownerId,
      {UserType? ownerType}) {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  /// Reads a single user profile from the database.
  @override
  Future<UserProfileModel> readOne(String userId, {UserType? ownerType}) async {
    Map<String, dynamic> data = await databaseService.getData(
        collection: _tableOrCollectionName, documentId: userId);

    return UserProfileModel.fromJson(data);
  }

  /// Updates a user profile in the database.
  @override
  Future<void> update(String userId, Map<String, dynamic> json) async {
    await databaseService.updateData(
      collection: _tableOrCollectionName,
      documentId: userId,
      data: json,
    );
  }
}
