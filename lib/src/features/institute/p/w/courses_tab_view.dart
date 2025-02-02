import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/routing/approute.dart';
import '../../../authentication/auth_service.dart';
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
              child: Text('some_error_occoured_during_data_fetch'.tr),
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
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: BatchList(batches: [
                                  BatchEntity(
                                    course: course,
                                    startDate: 987654321,
                                    endDate: 1617184800,
                                    students: [],
                                    teachers: [],
                                  ),
                                ]),
                              );
                            },
                          );
                        },
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
}
