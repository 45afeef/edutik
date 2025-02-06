import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/date_time_utils.dart';
import '../../do/entities/batch.dart';

class BatchList extends StatelessWidget {
  final List<BatchEntity> batches;

  const BatchList({
    super.key,
    required this.batches,
  });

  @override
  Widget build(BuildContext context) {
    if (batches.isEmpty) return Text('empty_list'.tr);

    return SingleChildScrollView(
      child: Column(
        children: batches
            .map((batch) => ListTile(
                  title: Text(batch.name),
                  subtitle: Text(
                      '${batch.startDate.toReadableTime(pattern: 'MMM d')}-${batch.endDate.toReadableTime(pattern: 'MMM d')}'),
                ))
            .toList(),
      ),
    );
  }
}
