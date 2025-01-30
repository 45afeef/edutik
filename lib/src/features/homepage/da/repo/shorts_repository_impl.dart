import '../../../../../utils/database/database_service.dart';
import '../../do/repo/shorts_repo.dart';
import '../shorts_model.dart';

const String _tableOrCollectionName = 'shorts';

class ShortsRepositoryImpl implements ShortsRepository {
  final DatabaseService databaseService;

  ShortsRepositoryImpl(this.databaseService);

  @override
  Future<void> deleteShorts(String shortsId) async {
    await databaseService.deleteData(
        collection: _tableOrCollectionName, documentId: shortsId);
  }

  @override
  Future<List<ShortsModel>> fetchAllShorts() async {
    List<Map<String, dynamic>> data =
        await databaseService.getAllData(collection: _tableOrCollectionName);

    return data.map((e) => ShortsModel.fromJson(e)).toList();
  }

  @override
  Future<ShortsModel> fetchShorts(String shortsId) async {
    Map<String, dynamic> data = await databaseService.getData(
        collection: _tableOrCollectionName, documentId: shortsId);

    return ShortsModel.fromJson(data);
  }

  @override
  Future<void> saveShorts(ShortsModel shorts) async {
    await databaseService.addData(
      collection: _tableOrCollectionName,
      data: shorts.toJson(),
    );
  }

  @override
  Future<void> updateShorts(String shortsId, ShortsModel shorts) async {
    await databaseService.updateData(
      collection: _tableOrCollectionName,
      documentId: shortsId,
      data: shorts.toJson(),
    );
  }
}
