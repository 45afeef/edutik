// Import necessary packages and modules
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/src/features/authentication/auth_service.dart';
import '/src/features/courses/controllers/batch_request_controller.dart';
import '/src/features/courses/da/models/batch_request_model.dart';
import '/src/features/courses/do/entities/batch_request.dart';

// Define a StatefulWidget for batch request functionality
class BatchRequestWidget extends StatefulWidget {
  final BatchRequestController controller;
  final String courseId;
  final String batchId;
  final bool isAdmin;
  final DateTime startDate;
  final Function()? onEdit;

  // Constructor with required parameters and an assertion for admin edit functionality
  const BatchRequestWidget({
    super.key,
    required this.controller,
    required this.courseId,
    required this.batchId,
    required this.isAdmin,
    required this.startDate,
    required this.onEdit,
  }) : assert(!isAdmin || onEdit != null,
            'onEdit must be provided when isAdmin is true');

  @override
  _BatchRequestWidgetState createState() => _BatchRequestWidgetState();
}

// State class for BatchRequestWidget
class _BatchRequestWidgetState extends State<BatchRequestWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    // If the user is an admin, show an edit button
    if (widget.isAdmin) {
      return ElevatedButton(
        onPressed: () => widget.onEdit!(),
        child: Text('lbl_edit'.tr),
      );
    }

    // If the batch start date is in the past, show an expired message
    if (widget.startDate.isBefore(DateTime.now())) {
      return Text('msg_expired'.tr);
    }

    // If the user is not logged in, show a login button
    if (AuthService().currentUser == null) {
      return ElevatedButton(
        onPressed: () => Get.toNamed('/login'),
        child: Text('lbl_login_to_request'.tr),
      );
    }

    // Use FutureBuilder to handle the request status asynchronously
    return FutureBuilder<BatchRequestEntity?>(
      future: widget.controller.getRequestStatus(
          widget.courseId, widget.batchId, AuthService().currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final request = snapshot.data;

        // If no request exists, show a send request button
        if (request == null) {
          return ElevatedButton(
            onPressed: _isLoading
                ? null
                : () async {
                    setState(() {
                      _isLoading = true;
                    });
                    final newRequest = BatchRequestModel(
                      courseId: widget.courseId,
                      batchId: widget.batchId,
                      studentId: AuthService().currentUser!.uid,
                      studentName: AuthService()
                          .currentUser!
                          .displayName, // Added studentName
                      status: BatchRequestStatus.pending,
                    );
                    await widget.controller.sendRequest(newRequest);
                    setState(() {
                      _isLoading = false;
                    });
                  },
            child: _isLoading
                ? const CircularProgressIndicator()
                : Text('lbl_send_request'.tr),
          );
        }

        // If a request exists, show appropriate button based on request status
        return ElevatedButton(
          onPressed: _isLoading
              ? null
              : request.status == BatchRequestStatus.rejected ||
                      request.status == BatchRequestStatus.none
                  ? () async {
                      setState(() {
                        _isLoading = true;
                      });
                      final newRequest = BatchRequestModel(
                        courseId: widget.courseId,
                        batchId: widget.batchId,
                        studentId: AuthService().currentUser!.uid,
                        studentName: AuthService()
                            .currentUser!
                            .displayName, // Added studentName
                        status: BatchRequestStatus.pending,
                      );
                      await widget.controller.sendRequest(newRequest);
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  : null,
          child: _isLoading
              ? const CircularProgressIndicator()
              : Text(
                  () {
                    switch (request.status) {
                      case BatchRequestStatus.pending:
                        return 'msg_request_pending'.tr;
                      case BatchRequestStatus.accepted:
                        return 'msg_request_accepted'.tr;
                      case BatchRequestStatus.rejected:
                        return 'lbl_resend_request'.tr;
                      case BatchRequestStatus.none:
                      default:
                        return 'lbl_send_request'.tr;
                    }
                  }(),
                ),
        );
      },
    );
  }
}
