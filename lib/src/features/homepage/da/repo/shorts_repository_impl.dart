import '../../../../../utils/database/database_service.dart';
import '../../do/content.dart';
import '../../do/repo/shorts_repo.dart';
import '../shorts_model.dart';

const String _tableOrCollectionName = 'shorts';

class ShortsRepositoryImpl implements ShortsRepository {
  final DatabaseService databaseService;

  ShortsRepositoryImpl(this.databaseService);

  @override
  Future<void> create(ShortsModel model) async {
    await databaseService.addData(
      collection: _tableOrCollectionName,
      data: model.toJson(),
    );
  }

  @override
  Future<void> delete(String modelId) async {
    await databaseService.deleteData(
        collection: _tableOrCollectionName, documentId: modelId);
  }

  @override
  Future<List<ShortsModel>> readAll(
    String ownerId, {
    UserType? ownerType,
  }) async {
    List<Map<String, dynamic>> data =
        await databaseService.getAllData(collection: _tableOrCollectionName);

    return data.map((e) => ShortsModel.fromJson(e)).toList();
  }

  @override
  Future<ShortsModel> readOne(
    String modelId, {
    UserType? ownerType,
  }) async {
    Map<String, dynamic> data = await databaseService.getData(
        collection: _tableOrCollectionName, documentId: modelId);

    return ShortsModel.fromJson(data);
  }

  @override
  Future<void> update(String modelId, json) async {
    await databaseService.updateData(
      collection: _tableOrCollectionName,
      documentId: modelId,
      data: json,
    );
  }
}
