import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/course_controller.dart';
import '../do/entities/batch.dart';

class BatchPage extends GetWidget<CourseController> {
  const BatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    BatchEntity batch = Get.arguments['batch'] as BatchEntity;

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
    );
  }
}
