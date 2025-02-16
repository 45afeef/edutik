import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/database/local_sqlite_service.dart';
import '../da/models/batch_request_model.dart';
import '../do/repo/batch_request_repo.dart';

class BatchRequestController extends ChangeNotifier {
  final BatchRequestRepository repository = Get.find<BatchRequestRepository>();
  final SqLiteService _localDb = SqLiteService();

  BatchRequestController();

  Future<void> acceptRequest(String requestId, String batchId) async {
    await repository
        .update(requestId, {'status': 'accepted', 'batchId': batchId});
    notifyListeners();
  }

  Future<List<BatchRequestModel>> getRequests(String batchId) async {
    throw UnimplementedError();
  }

  Future<BatchRequestModel?> getRequestStatus(
      String courseId, String batchId, String studentId) async {
    // Check local database first
    var localRequests = await _localDb.queryData(
      collection: 'batch_request',
      query: {"courseId": courseId, "batchId": batchId, "studentId": studentId},
    );

    var localRequestModels = localRequests.map((e) {
      return BatchRequestModel.fromJson(e);
    }).toList();

    var localRequest = localRequestModels.firstWhereOrNull((request) =>
        request.courseId == courseId && request.studentId == studentId);

    if (localRequest != null) {
      return localRequest;
    }
    return null;

    // If not found in local database, check remote database

    // TODO - remove this as it cost a lot of money.
    // URGENCY: HIGH
    // final requests = await repository.readAll(batchId);
    // return requests.firstWhereOrNull((request) =>
    //     request.courseId == courseId && request.studentId == studentId);
  }

  Future<void> rejectRequest(String requestId, String batchId) async {
    await repository
        .update(requestId, {'status': 'rejected', 'batchId': batchId});
    notifyListeners();
  }

  Future<void> sendRequest(BatchRequestModel request) async {
    // Save request in remote database
    await repository.create(request);

    // Save request in local database
    await _localDb.addData(
      collection: 'batch_request',
      data: request.toJson(),
    );

    notifyListeners();
  }
}
