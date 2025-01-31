import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../do/entities/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard(this.course, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          // Background Image
          Image.network(
            course.bannerImageUri,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              // width: double.infinity,
              // height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
          // Course Name at Top Left
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              course.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Price at Bottom Right
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '${course.price.currency} ${course.price.amount.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          // Button at Bottom Left
          Positioned(
            bottom: 10,
            left: 10,
            child: ElevatedButton(
              onPressed: () {
                // Add your button action here
              },
              child: Text('lbl_enroll_now'.tr),
            ),
          ),
        ],
      ),
    );
  }
}
