import '../../../../../utils/database/database_service.dart';
import '../../do/repo/shorts_repo.dart';
import '../shorts_model.dart';

class ShortsRepositoryImpl implements ShortsRepository {
  final DatabaseService databaseService;

  ShortsRepositoryImpl(this.databaseService);

  @override
  Future<void> deleteShorts(String shortsId) async {
    await databaseService.deleteData(
        collection: 'shorts', documentId: shortsId);
  }

  @override
  Future<List<ShortsModel>> fetchAllShorts() async {
    List<Map<String, dynamic>> data =
        await databaseService.getAllData(collection: 'shorts');

    return data.map((e) => ShortsModel.fromJson(e)).toList();
  }

  @override
  Future<ShortsModel> fetchShorts(String shortsId) async {
    Map<String, dynamic> data = await databaseService.getData(
        collection: 'shorts', documentId: shortsId);

    return ShortsModel.fromJson(data);
  }

  @override
  Future<void> saveShorts(ShortsModel shorts) async {
    await databaseService.addData(
      collection: 'shorts',
      data: shorts.toJson(),
    );
  }

  @override
  Future<void> updateShorts(String shortsId, ShortsModel shorts) async {
    await databaseService.updateData(
      collection: 'shorts',
      documentId: shortsId,
      data: shorts.toJson(),
    );
  }
}
