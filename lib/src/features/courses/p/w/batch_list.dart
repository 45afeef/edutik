import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/src/features/courses/controllers/batch_request_controller.dart';
import '/src/features/courses/do/entities/batch.dart';
import '/src/features/courses/p/batch_request_management_screen.dart';
import '/utils/date_time_utils.dart';
import 'batch_request_widget.dart';

class BatchList extends StatelessWidget {
  final List<BatchEntity> batches;
  final bool isAdmin;
  final void Function(BatchEntity batch)? onEdit;

  const BatchList({
    required this.batches,
    this.isAdmin = false,
    this.onEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (batches.isEmpty) return Text('empty_list'.tr);

    return SingleChildScrollView(
      child: Column(
        children: batches
            .map(
              (batch) => ListTile(
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
                      startDate: DateTime.fromMillisecondsSinceEpoch(
                          batch.startDate * 1000),
                    ),
                  ],
                ),
                trailing: isAdmin
                    ? IconButton(
                        icon: const Icon(Icons.manage_accounts),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BatchRequestManagementScreen(
                                controller: Get.find<BatchRequestController>(),
                                courseId: batch.courseId,
                                batchId: batch.id!,
                              ),
                            ),
                          );
                        },
                      )
                    : null,
              ),
            )
            .toList(),
      ),
    );
  }
}
