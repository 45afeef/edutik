import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../homepage/p/w/multi_selection_page.dart';
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
              onPressed: () async {
                final List<String>? selectedAssessments =
                    await Get.to<List<String>>(
                  () => MultiSelectionPage<String>(
                    items: const [
                      'controller.availableAssessments',
                      'fgs',
                      'dfg'
                    ],
                    title: 'Select Assessments',
                    searchHint: 'Search assessments...',
                    searchPredicate: (assessment, query) =>
                        assessment.toLowerCase().contains(query.toLowerCase()),
                    itemBuilder: (assessment, isSelected) => ListTile(
                      title: Text(assessment),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : null,
                    ),
                  ),
                );

                if (selectedAssessments != null &&
                    selectedAssessments.isNotEmpty) {
                  // Handle the selected assessments
                  // You might want to add these to the batch
                  // controller.addAssessmentsToBatch(
                  //     batch.id!, selectedAssessments);
                }
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
