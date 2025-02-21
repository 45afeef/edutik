import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/database/local_sqlite_service.dart';
import '../da/models/batch_request_model.dart';
import '../da/repo/batch_request_repository_impl.dart';
import '../do/entities/batch_request.dart';
import '../do/repo/batch_request_repo.dart';

class BatchRequestController extends ChangeNotifier {
  final BatchRequestRepository repository = Get.find<BatchRequestRepository>();
  final SqLiteService _localDb = SqLiteService();

  BatchRequestController();

  Future<void> approveRequest(
      String requestId, String batchId, String courseId) async {
    await repository.update(requestId, {
      'status': 'accepted',
      'batchId': batchId,
      'courseId': courseId,
    });
    notifyListeners();
  }

  Future<List<BatchRequestEntity>> getBatchRequests(
    String courseId,
    String batchId,
  ) async {
    final remoteRequests = await repository.readAll('$courseId/$batchId');
    return remoteRequests;
  }

  Future<List<BatchRequestEntity>> getPendingBatchRequests(
    String courseId,
    String batchId,
  ) async {
    final remoteRequests =
        await repository.readPendingRequests(courseId, batchId);
    return remoteRequests;
  }

  /// This method will return the request status of a student for a particular batch
  /// If the request is not found in the local database, it will check the remote database
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

  Future<void> rejectRequest(
      String requestId, String batchId, String courseId) async {
    await repository.update(requestId, {
      'status': 'rejected',
      'batchId': batchId,
      'courseId': courseId,
    });
    notifyListeners();
  }

  Future<void> sendRequest(BatchRequestModel request) async {
    // Save request in remote database
    await repository.create(request);

    // Save request in local database
    await _localDb.addData(
      collection: kBatchRequestsTableName,
      data: request.toJson(),
    );

    notifyListeners();
  }
}
