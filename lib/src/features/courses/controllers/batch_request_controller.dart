import 'package:get/get.dart';

import '../../../../utils/database/local_sqlite_service.dart';
import '../da/models/batch_request_model.dart';
import '../da/repo/batch_request_repository_impl.dart';
import '../do/entities/batch_request.dart';
import '../do/repo/batch_request_repo.dart';

/// Controller for managing batch requests.
class BatchRequestController extends GetxController {
  final BatchRequestRepository repository = Get.find<BatchRequestRepository>();
  final SqLiteService _localDb = SqLiteService();

  BatchRequestController();

  /// Approves a batch request by updating its status to 'accepted' in the remote database.
  ///
  /// [requestId] is the ID of the request to approve.
  /// [batchId] is the ID of the batch.
  /// [courseId] is the ID of the course.
  Future<void> approveRequest(
      String requestId, String batchId, String courseId) async {
    await repository.update(requestId, {
      'status': 'accepted',
      'batchId': batchId,
      'courseId': courseId,
    });
  }

  /// Retrieves all batch requests for a specific course and batch from the remote database.
  ///
  /// [courseId] is the ID of the course.
  /// [batchId] is the ID of the batch.
  /// Returns a list of [BatchRequestEntity].
  Future<List<BatchRequestEntity>> getBatchRequests(
    String courseId,
    String batchId,
  ) async {
    final remoteRequests = await repository.readAll('$courseId/$batchId');
    return remoteRequests;
  }

  /// Retrieves all pending batch requests for a specific course and batch from the remote database.
  ///
  /// [courseId] is the ID of the course.
  /// [batchId] is the ID of the batch.
  /// Returns a list of [BatchRequestEntity].
  Future<List<BatchRequestEntity>> getPendingBatchRequests(
    String courseId,
    String batchId,
  ) async {
    final remoteRequests =
        await repository.readPendingRequests(courseId, batchId);
    return remoteRequests;
  }

  /// Returns the request status of a student for a particular batch.
  ///
  /// [courseId] is the ID of the course.
  /// [batchId] is the ID of the batch.
  /// [studentId] is the ID of the student.
  /// If the request is not found in the local database, it will check the remote database.
  Future<BatchRequestEntity?> getRequestStatus(
      String courseId, String batchId, String studentId) async {
    // Check local database first
    var localRequests = await _localDb.queryData(
      collection: kBatchRequestsTableName,
      query: {
        "courseId": courseId,
        "batchId": batchId,
        "studentId": studentId,
      },
    );

    var localRequestModels = localRequests.map((e) {
      return BatchRequestModel.fromJson(e);
    }).toList();

    var localRequest = localRequestModels.firstWhereOrNull((request) =>
        request.courseId == courseId && request.studentId == studentId);

    if (localRequest != null) {
      return localRequest;
    }
    throw Exception(
        'Request not found in local database, remote is not implemented yet');

    // If not found in local database, check remote database

    // TODO - remove this as it cost a lot of money.
    // URGENCY: HIGH
    // final requests = await repository.readAll(batchId);
    // return requests.firstWhereOrNull((request) =>
    //     request.courseId == courseId && request.studentId == studentId);
  }

  /// Rejects a batch request by updating its status to 'rejected' in the remote database.
  ///
  /// [requestId] is the ID of the request to reject.
  /// [batchId] is the ID of the batch.
  /// [courseId] is the ID of the course.
  Future<void> rejectRequest(
      String requestId, String batchId, String courseId) async {
    await repository.update(requestId, {
      'status': 'rejected',
      'batchId': batchId,
      'courseId': courseId,
    });
  }

  /// Sends a new batch request to the remote database and saves it in the local database.
  ///
  /// Saving in local database is done to prevent multiple requests from the same user.
  /// It also minimizes the number of requests to the remote database. Which results in cost savings.
  ///
  /// [request] is the [BatchRequestModel] to send.
  Future<void> sendRequest(BatchRequestModel request) async {
    // Save request in remote database
    await repository.create(request);

    // Save request in local database
    await _localDb.addData(
      collection: kBatchRequestsTableName,
      data: request.toJson(),
    );
  }
}
