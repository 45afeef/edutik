import 'package:flutter/material.dart';

import '../controllers/batch_request_controller.dart';
import 'w/batch_request_management_widget.dart';

/// A screen that manages and displays batch requests for a specific course and batch.
class BatchRequestManagementScreen extends StatelessWidget {
  final BatchRequestController controller;
  final String courseId;
  final String batchId;

  /// Creates a [BatchRequestManagementScreen].
  ///
  /// The [controller], [courseId], and [batchId] parameters are required.
  const BatchRequestManagementScreen({
    super.key,
    required this.controller,
    required this.courseId,
    required this.batchId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Batch Request Management'),
      ),
      body: BatchRequestManagementWidget(
        controller: controller,
        courseId: courseId,
        batchId: batchId,
      ),
    );
  }
}
