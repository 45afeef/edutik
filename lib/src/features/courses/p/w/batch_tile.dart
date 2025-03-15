import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/utils/date_time_utils.dart';
import '../../controllers/batch_request_controller.dart';
import '../../do/entities/batch.dart';
import '../batch_request_management_screen.dart';
import 'batch_request_widget.dart';

/// A widget that displays a single batch item.
///
/// The [BatchTile] widget takes a [BatchEntity] object and displays its
/// name, start and end dates, and a [BatchRequestWidget] for managing batch requests.
/// If the user is an admin, an edit button is shown, allowing the admin to manage
/// batch requests. The [onEdit] callback is triggered when the edit button is pressed.
///
/// The [BatchTile] widget is stateless and does not manage any state internally.
///
/// Used at:
/// 1. [BatchList]
///
class BatchTile extends StatelessWidget {
  final BatchEntity batch;
  final bool isAdmin;
  final bool showRequestButton;

  final void Function(BatchEntity batch)? onEdit;
  const BatchTile({
    super.key,
    required this.batch,
    required this.isAdmin,
    required this.onEdit,
    required this.showRequestButton,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(batch.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${batch.startDate.toReadableTime(pattern: 'MMM d yyyy')}-${batch.endDate.toReadableTime(pattern: 'MMM d yyyy')}',
          ),
          if (showRequestButton)
            BatchRequestWidget(
              controller: Get.find<BatchRequestController>(),
              courseId: batch.courseId,
              batchId: batch.id!,
              isAdmin: isAdmin,
              onEdit: onEdit != null ? () => onEdit!(batch) : null,
              startDate:
                  DateTime.fromMillisecondsSinceEpoch(batch.startDate * 1000),
            ),
        ],
      ),
      // Edit button is shown only if the user is an admin
      trailing: isAdmin
          ? IconButton(
              icon: const Icon(Icons.manage_accounts),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BatchRequestManagementScreen(
                      controller: Get.find<BatchRequestController>(),
                      courseId: batch.courseId,
                      batchId: batch.id!,
                    ),
                  ),
                );
              },
            )
          : null,
    );
  }
}
