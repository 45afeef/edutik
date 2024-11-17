import '../../shorts_model.dart';
import '../../../do/repo/shorts_repo.dart';

class NetworkShortsRepository implements ShortsRepository {
  @override
  Future<void> deleteShorts(String id) {
    // TODO: implement deleteShorts
    throw UnimplementedError();
  }

  @override
  Future<List<ShortsModel>> fetchAllShorts() {
    // TODO: implement getAllShorts
    throw UnimplementedError();
  }

  @override
  Future<ShortsModel> fetchShorts(String id) {
    // TODO: implement getShorts
    throw UnimplementedError();
  }

  @override
  Future<void> saveShorts(ShortsModel shorts) {
    // TODO: implement saveShorts
    throw UnimplementedError();
  }
}
