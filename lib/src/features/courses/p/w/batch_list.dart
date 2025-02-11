import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/date_time_utils.dart';
import '../../controllers/batch_request_controller.dart';
import '../../do/entities/batch.dart';
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
                      isAdmin: !isAdmin,
                      onEdit: onEdit != null ? () => onEdit!(batch) : null,
                      startDate: DateTime.fromMillisecondsSinceEpoch(
                          batch.startDate * 1000),
                    ),
                  ],
                ),
                trailing: null,
              ),
            )
            .toList(),
      ),
    );
  }
}
