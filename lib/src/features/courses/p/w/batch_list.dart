import 'package:flutter/material.dart';

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
    return ListView.builder(
      itemCount: batches.length,
      itemBuilder: (BuildContext context, int index) {
        final batch = batches[index];

        return ListTile(
          leading: Text('${index + 1}'),
          title: Text(batch.startDate.toReadableTime(pattern: 'd MMMM yy')),
          subtitle: Text(batch.endDate.toReadableTime(pattern: 'd MMMM yy')),
        );
      },
    );
  }
}
