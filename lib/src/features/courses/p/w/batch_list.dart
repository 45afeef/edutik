import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/date_time_utils.dart';
import '../../do/entities/batch.dart';

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
                subtitle: Text(
                    '${batch.startDate.toReadableTime(pattern: 'MMM d')}-${batch.endDate.toReadableTime(pattern: 'MMM d')}'),
                trailing: isAdmin
                    ? ElevatedButton(
                        onPressed: () => onEdit?.call(batch),
                        child: Text('edit'.tr),
                      )
                    : null,
              ),
            )
            .toList(),
      ),
    );
  }
}
