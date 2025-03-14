import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/src/features/courses/p/w/batch_list.dart';
import '../../../../../courses/controllers/batch_request_controller.dart';
import '../../../../../courses/do/entities/batch.dart';
import '../../../w/loading.dart';
import '../profile_controller.dart';

class JoinedBatches extends GetWidget<ProfileController> {
  const JoinedBatches({super.key});

  @override
  Widget build(BuildContext context) {
    BatchRequestController batchRequestcontroller =
        Get.find<BatchRequestController>();

    List<String> joinedBatches =
        controller.userProfile.value.joinedBatches ?? [];

    if (joinedBatches.isEmpty) {
      return const Center(child: Text('No joined batches'));
    }

    return FutureBuilder<List<BatchEntity>>(
      future: batchRequestcontroller.fetchBatchByReference(joinedBatches),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CustomProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return BatchList(
            batches: snapshot.data!,
            isAdmin: false,
          );
        } else {
          return const Center(child: Text('No joined batches'));
        }
      },
    );
  }
}
