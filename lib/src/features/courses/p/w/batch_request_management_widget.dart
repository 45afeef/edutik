import 'package:flutter/material.dart';

import '../../controllers/batch_request_controller.dart';
import '../../do/entities/batch_request.dart';

/// A widget that manages and displays batch requests for a specific course and batch.
///
/// This widget fetches the batch requests using the provided [BatchRequestController]
/// and displays them in a list. Each request can be approved or rejected using the
/// respective buttons.
class BatchRequestManagementWidget extends StatefulWidget {
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
  State<BatchRequestManagementWidget> createState() =>
      _BatchRequestManagementWidgetState();
}

class _BatchRequestManagementWidgetState
    extends State<BatchRequestManagementWidget> {
  late Future<List<BatchRequestEntity>> _batchRequestsFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BatchRequestEntity>>(
      future: _batchRequestsFuture,
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
                        if (request.status != BatchRequestStatus.accepted) {
                          await widget.controller.approveRequest(
                            request.id!,
                            widget.batchId,
                            request.courseId,
                          );
                          setState(() {
                            request.status = BatchRequestStatus.accepted;
                          });
                        }
                      }),
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: request.status == BatchRequestStatus.rejected
                        ? Colors.red
                        : null,
                    onPressed: () async {
                      if (request.status != BatchRequestStatus.rejected) {
                        await widget.controller.rejectRequest(
                          request.id!,
                          widget.batchId,
                          request.courseId,
                        );
                        setState(() {
                          request.status = BatchRequestStatus.rejected;
                        });
                      }
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

  @override
  void initState() {
    super.initState();
    _batchRequestsFuture = widget.controller.getPendingBatchRequests(
      widget.courseId,
      widget.batchId,
    );
  }

  Future<void> _refreshRequests() async {
    setState(() {
      _batchRequestsFuture = widget.controller.getPendingBatchRequests(
        widget.courseId,
        widget.batchId,
      );
    });
  }
}
