import '../../da/shorts_model.dart';

abstract class ShortsRepository {
  Future<ShortsModel> fetchShorts(String id);
  Future<List<ShortsModel>> fetchAllShorts();
  Future<void> saveShorts(ShortsModel shorts);
  Future<void> deleteShorts(String id);
}
