import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/multi_selection_page.dart';
import '../../assessment/do/assessment.dart';
import '../../institute/do/entity/institute.dart';
import '../../institute/p/controllers/institute_controller.dart';
import '../controllers/course_controller.dart';
import '../do/entities/batch.dart';

class BatchPage extends StatelessWidget {
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
                final CourseController courseController =
                    Get.find<CourseController>();

                final InstituteController instituteController =
                    Get.find<InstituteController>();

                var assessments =
                    await instituteController.fetchInstitutesAssessments();

                final List<Assessment>? selectedAssessments =
                    await Get.to<List<Assessment>>(
                  () => MultiSelectionPage<Assessment>(
                    items: assessments,
                    title: 'Select Assessments',
                    searchHint: 'Search assessments...',
                    searchPredicate: (assessment, query) => assessment.name
                        .toLowerCase()
                        .contains(query.toLowerCase()),
                    itemBuilder: (assessment, isSelected) => ListTile(
                      title: Text(assessment.name),
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
                  courseController.addAssessmentsToBatch(
                      batch.id!,
                      batch.courseId,
                      selectedAssessments
                          .map((assessment) => assessment.id!)
                          .toList());
                }
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
