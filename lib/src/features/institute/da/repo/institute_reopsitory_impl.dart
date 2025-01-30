import '../../../../../utils/database/database_service.dart';
import '../../../homepage/do/content.dart';
import '../../do/repo/institute_repo.dart';
import '../model/institute_model.dart';

const String _tableOrCollectionName = 'institutes';

class InstituteReopsitoryImpl extends InstituteRepository {
  final DatabaseService databaseService;

  InstituteReopsitoryImpl(this.databaseService);

  @override
  Future<void> create(InstituteModel model) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String modelId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<InstituteModel>> readAll(String ownerId, {UserType? ownerType}) {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  Future<InstituteModel> readOne(
    String modelId, {
    UserType? ownerType,
  }) async {
    Map<String, dynamic> data = await databaseService.getData(
        collection: _tableOrCollectionName, documentId: modelId);

    // TODO - handle institute not found error in UI
    return InstituteModel.fromJson(data);
  }

  @override
  Future<void> update(String modelId, InstituteModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
