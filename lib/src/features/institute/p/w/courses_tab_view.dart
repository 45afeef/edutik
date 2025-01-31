import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../authentication/auth_service.dart';
import '../../../courses/do/entities/course.dart';
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
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allCourses.length,
                  itemBuilder: (BuildContext context, int index) {
                    final course = allCourses[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CourseCard(course),
                    );
                  },
                );
        },
      ),
      floatingActionButton: _isAdmin()
          ? FloatingActionButton(
              onPressed: () => throw UnimplementedError(),
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
