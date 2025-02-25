import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/src/features/authentication/auth_service.dart';
import '/src/features/courses/controllers/batch_request_controller.dart';
import '/src/features/courses/da/models/batch_request_model.dart';
import '/src/features/courses/do/entities/batch_request.dart';

class BatchRequestWidget extends StatefulWidget {
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
  }) : assert(!isAdmin || onEdit != null,
            'onEdit must be provided when isAdmin is true');

  @override
  _BatchRequestWidgetState createState() => _BatchRequestWidgetState();
}

class _BatchRequestWidgetState extends State<BatchRequestWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isAdmin) {
      return ElevatedButton(
        onPressed: () => widget.onEdit!(),
        child: Text('edit'.tr),
      );
    }

    if (widget.startDate.isBefore(DateTime.now())) {
      return Text('expired'.tr);
    }

    if (AuthService().currentUser == null) {
      return ElevatedButton(
        onPressed: () => Get.toNamed('/login'),
        child: Text('login_to_request'.tr),
      );
    }

    return FutureBuilder<BatchRequestEntity?>(
      future: widget.controller.getRequestStatus(
          widget.courseId, widget.batchId, AuthService().currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final request = snapshot.data;

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
                : const Text('Send Request'),
          );
        }

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
