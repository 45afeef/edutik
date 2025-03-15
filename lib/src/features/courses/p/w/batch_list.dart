import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/src/features/courses/do/entities/batch.dart';
import 'batch_request_widget.dart';
import 'batch_tile.dart';

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

  /// Indicates whether to show the request button.
  final bool showRequestButton;

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
    this.showRequestButton = false,
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
            .map((batch) => BatchTile(
                  batch: batch,
                  isAdmin: isAdmin,
                  onEdit: onEdit,
                  showRequestButton: showRequestButton,
                ))
            .toList(),
      ),
    );
  }
}
