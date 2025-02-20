import 'package:flutter/material.dart';

import '../../../courses/do/entities/course.dart';
import 'course_card.dart';

class CourseList extends StatelessWidget {
  final List<Course> courses;
  final Function(Course) onCoursePressed;

  const CourseList({
    super.key,
    required this.courses,
    required this.onCoursePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 150),
      itemCount: courses.length,
      itemBuilder: (BuildContext context, int index) {
        final course = courses[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CourseCard(
            course,
            onPressed: () => onCoursePressed(course),
          ),
        );
      },
    );
  }
}
