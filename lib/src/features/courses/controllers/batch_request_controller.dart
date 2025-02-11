import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../da/models/batch_request_model.dart';
import '../do/repo/batch_request_repo.dart';

class BatchRequestController extends ChangeNotifier {
  final BatchRequestRepository repository = Get.find<BatchRequestRepository>();

  BatchRequestController();

  Future<void> acceptRequest(String requestId, String batchId) async {
    await repository
        .update(requestId, {'status': 'accepted', 'batchId': batchId});
    notifyListeners();
  }

  Future<List<BatchRequestModel>> getRequests(String batchId) async {
    return await repository.readAll(batchId);
  }

  Future<void> rejectRequest(String requestId, String batchId) async {
    await repository
        .update(requestId, {'status': 'rejected', 'batchId': batchId});
    notifyListeners();
  }

  Future<void> sendRequest(BatchRequestModel request) async {
    await repository.create(request);
    notifyListeners();
  }
}
