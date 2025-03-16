import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/utils/routing/approute.dart';
import '../../institute/do/entity/institute.dart';
import '../controllers/course_controller.dart';
import '../do/entities/batch.dart';

class BatchPage extends GetWidget<CourseController> {
  const BatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    BatchEntity batch = Get.arguments['batch'] as BatchEntity;

    bool isEditor = Get.arguments['isEditor'] as bool? ?? false;
    Institute? institute = Get.arguments['institute'] as Institute?;

    if (isEditor) {
      assert(institute != null,
          'Institute must not be null when isEditor is true');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(batch.name),
      ),
      body: ListView.builder(
        itemCount: batch.assessments?.length ?? 0,
        itemBuilder: (context, index) {
          final assessment = batch.assessments![index];
          return ListTile(
            title: Text(assessment),
          );
        },
      ),
      floatingActionButton: isEditor
          ? FloatingActionButton(
              onPressed: () => Get.toNamed(
                AppRoute.assessmentCreationPage,
                arguments: {
                  'ownerId': institute!.id,
                  'ownerName': institute.name
                },
              ),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
