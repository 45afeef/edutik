import '../../../../../utils/database/repo.dart';
import '../../da/models/batch_request_model.dart';

abstract class BatchRequestRepository extends Repository<BatchRequestModel> {
  Future<List<BatchRequestModel>> readPendingRequests(
      String courseId, String batchId);
}
