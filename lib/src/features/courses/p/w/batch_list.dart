import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/src/features/courses/controllers/batch_request_controller.dart';
import '/src/features/courses/do/entities/batch.dart';
import '/src/features/courses/p/batch_request_management_screen.dart';
import '/utils/date_time_utils.dart';
import 'batch_request_widget.dart';

/// A widget that displays a list of batches.
///
/// The [BatchList] widget takes a list of [BatchEntity] objects and displays them
/// in a scrollable list. If the list is empty, it shows a message indicating that
/// there are no batches available. Each batch item displays the batch name, start
/// and end dates, and a [BatchRequestWidget] for managing batch requests.
///
/// If the user is an admin, an edit button is shown for each batch item, allowing
/// the admin to manage batch requests. The [onEdit] callback is triggered when the
/// edit button is pressed.
///
/// The [BatchList] widget is stateless and does not manage any state internally.
///
/// Used at:
/// 1. [CoursesTabBarView]
///
class BatchList extends StatelessWidget {
  /// The list of batches to display.
  final List<BatchEntity> batches;

  /// Indicates whether the user is an admin.
  final bool isAdmin;

  /// Callback function to handle batch editing.
  final void Function(BatchEntity batch)? onEdit;

  /// Creates a [BatchList] widget.
  ///
  /// The [batches] parameter is required and must not be null.
  /// The [isAdmin] parameter defaults to false.
  /// The [onEdit] parameter is optional.

  const BatchList({
    required this.batches,
    this.isAdmin = false,
    this.onEdit,
    super.key,
  }) : assert(
          isAdmin ? onEdit != null : onEdit == null,
          'When isAdmin is true, onEdit must not be null; when isAdmin is false, onEdit must be null',
        );

  @override
  Widget build(BuildContext context) {
    if (batches.isEmpty) return Center(child: Text('empty_list'.tr));

    return SingleChildScrollView(
      child: Column(
        children: batches
            .map((batch) =>
                BatchTile(batch: batch, isAdmin: isAdmin, onEdit: onEdit))
            .toList(),
      ),
    );
  }
}

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

  final void Function(BatchEntity batch)? onEdit;
  const BatchTile({
    super.key,
    required this.batch,
    required this.isAdmin,
    required this.onEdit,
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
