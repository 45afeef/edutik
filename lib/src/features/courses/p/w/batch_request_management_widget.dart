import 'package:flutter/material.dart';

import '../../controllers/batch_request_controller.dart';
import '../../do/entities/batch_request.dart';

/// A widget that manages and displays batch requests for a specific course and batch.
///
/// This widget fetches the batch requests using the provided [BatchRequestController]
/// and displays them in a list. Each request can be approved or rejected using the
/// respective buttons.
class BatchRequestManagementWidget extends StatelessWidget {
  /// The controller used to manage batch requests.
  final BatchRequestController controller;

  /// The ID of the course for which batch requests are being managed.
  final String courseId;

  /// The ID of the batch for which batch requests are being managed.
  final String batchId;

  /// Creates a [BatchRequestManagementWidget].
  ///
  /// The [controller], [courseId], and [batchId] parameters are required.
  const BatchRequestManagementWidget({
    super.key,
    required this.controller,
    required this.courseId,
    required this.batchId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BatchRequestEntity>>(
      future: controller.getBatchRequests(courseId, batchId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final requests = snapshot.data ?? [];

        if (requests.isEmpty) {
          return const Text('No requests found');
        }

        return ListView.builder(
          itemCount: requests.length,
          itemBuilder: (context, index) {
            final request = requests[index];
            return ListTile(
              title: Text(request.studentId),
              subtitle: Text(request.status.name.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check),
                    color: request.status == BatchRequestStatus.accepted
                        ? Colors.green
                        : null,
                    onPressed: () async {
                      await controller.approveRequest(
                        request.id!,
                        batchId,
                        request.courseId,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Request approved')),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: request.status == BatchRequestStatus.rejected
                        ? Colors.red
                        : null,
                    onPressed: () async {
                      await controller.rejectRequest(
                        request.id!,
                        batchId,
                        request.courseId,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Request rejected')),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
