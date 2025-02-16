import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../authentication/auth_service.dart';
import '../../controllers/batch_request_controller.dart';
import '../../da/models/batch_request_model.dart';
import '../../do/entities/batch_request.dart';

class BatchRequestWidget extends StatelessWidget {
  final BatchRequestController controller;
  final String courseId;
  final String batchId;
  final bool isAdmin;
  final DateTime startDate;
  final Function()? onEdit;

  const BatchRequestWidget({
    super.key,
    required this.controller,
    required this.courseId,
    required this.batchId,
    required this.isAdmin,
    required this.startDate,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    if (isAdmin) {
      return ElevatedButton(
        onPressed: () => onEdit!(),
        child: Text('edit'.tr),
      );
    }

    if (startDate.isBefore(DateTime.now())) {
      return Text('expired'.tr);
    }

    if (AuthService().currentUser == null) {
      return ElevatedButton(
        onPressed: () => Get.toNamed('/login'),
        child: Text('login_to_request'.tr),
      );
    }

    return FutureBuilder<BatchRequestModel?>(
      future: controller.getRequestStatus(
          courseId, batchId, AuthService().currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final request = snapshot.data;

        if (request == null) {
          return ElevatedButton(
            onPressed: () {
              final newRequest = BatchRequestModel(
                courseId: courseId,
                batchId: batchId,
                studentId: AuthService().currentUser!.uid,
                status: BatchRequestStatus.pending,
              );
              controller.sendRequest(newRequest);
            },
            child: const Text('Send Request'),
          );
        }

        return ElevatedButton(
          onPressed: request.status == BatchRequestStatus.rejected ||
                  request.status == BatchRequestStatus.none
              ? () {
                  final newRequest = BatchRequestModel(
                    courseId: courseId,
                    batchId: batchId,
                    studentId: AuthService().currentUser!.uid,
                    status: BatchRequestStatus.pending,
                  );
                  controller.sendRequest(newRequest);
                }
              : null,
          child: Text(
            () {
              switch (request.status) {
                case BatchRequestStatus.pending:
                  return 'Request Pending';
                case BatchRequestStatus.accepted:
                  return 'Request Accepted';
                case BatchRequestStatus.rejected:
                  return 'Resend Request';
                case BatchRequestStatus.none:
                default:
                  return 'Send Request';
              }
            }(),
          ),
        );
      },
    );
  }
}
