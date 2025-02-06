import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/routing/approute.dart';
import '../../../authentication/auth_service.dart';
import '../../../courses/da/models/batch_model.dart';
import '../../../courses/do/entities/batch.dart';
import '../../../courses/do/entities/course.dart';
import '../../../courses/p/w/batch_list.dart';
import '../../../courses/p/w/course_card.dart';
import '../../../homepage/p/w/empty_item.dart';
import '../../../homepage/p/w/loading.dart';
import '../../do/entity/institute.dart';
import '../controllers/institute_controller.dart';

class CoursesTabBarView extends GetWidget<InstituteController> {
  final Institute institute;

  const CoursesTabBarView(this.institute, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Course>>(
        future: controller.fetchInstitutesCourses(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  '${'some_error_occoured_during_data_fetch'.tr} ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CustomProgressIndicator());
          }

          List<Course> allCourses = snapshot.data!;

          return allCourses.isEmpty
              ? EmptyItem(itemName: 'courses'.tr)
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 150),
                  itemCount: allCourses.length,
                  itemBuilder: (BuildContext context, int index) {
                    final course = allCourses[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CourseCard(
                        course,
                        onPressed: () => _showBatchList(context, course.id!),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: _isAdmin()
          ? FloatingActionButton(
              onPressed: () {
                Get.toNamed(AppRoute.courseCreationPage);
              },
              child: Tooltip(
                message: 'msg_create_new_course'.tr,
                child: const Icon(Icons.add),
              ),
            )
          : null,
    );
  }

  bool _isAdmin() {
    final AuthService auth = AuthService();

    return institute.editors.contains(auth.currentUser?.uid);
  }

  void _showBatchCreationDialog(BuildContext context, String courseId) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController startDateController = TextEditingController();
    final TextEditingController endDateController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('create_batch'.tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'batch_name'.tr),
                keyboardType: TextInputType.name,
              ),
              TextField(
                controller: startDateController,
                decoration: InputDecoration(labelText: 'start_date'.tr),
                keyboardType: TextInputType.datetime,
              ),
              TextField(
                controller: endDateController,
                decoration: InputDecoration(labelText: 'end_date'.tr),
                keyboardType: TextInputType.datetime,
              ),
              // Add additional input fields for students, teachers, mentors, events, and achievements if needed.
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                // Add logic to create a BatchEntity instance
                // and process input values.

                final String batchName = nameController.text;
                final int startDate =
                    int.tryParse(startDateController.text) ?? 0;
                final int endDate = int.tryParse(endDateController.text) ?? 0;

                final BatchModel newBatch = BatchModel(
                  courseId: courseId,
                  name: batchName,
                  startDate: startDate,
                  endDate: endDate,
                  students: [],
                  teachers: [],
                );

                // Handle the newBatch instance (e.g., save to database, update UI)

                controller.saveCourseBatch(newBatch);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showBatchList(BuildContext context, String courseId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: FutureBuilder<List<BatchEntity>>(
            future: controller.fetchCourseBatches(courseId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('${'error_on_loading'.tr} ${snapshot.error}');
              }

              if (snapshot.hasData) {
                final batches = snapshot.data ?? [];
                return BatchList(batches: batches);
              }
              return const CircularProgressIndicator();
            },
          ),
          actions: [
            TextButton(
              onPressed: () => _showBatchCreationDialog(context, courseId),
              child: Text('lbl_create_batch'.tr),
            )
          ],
        );
      },
    );
  }
}
