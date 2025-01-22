import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/routing/approute.dart';

class AssessmentTabBarView extends StatelessWidget {
  final List<String>? assessmentRefs;
  const AssessmentTabBarView(this.assessmentRefs, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: assessmentRefs?.length,
      itemBuilder: (BuildContext context, int index) {
        final assessmentId = assessmentRefs?[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              leading: Text('${index + 1}'),
              title: const Text('Public Assessment'),
              onTap: () {
                // Navigate to the assessment page
                Get.toNamed(
                  AppRoute.assessmentPage.replaceFirst(':id', '$assessmentId'),
                );
                // Navigator.pushNamed(
                //   context,
                //   AppRoute.assessmentPage.replaceFirst(':id', '$assessmentId'),
                // );
              },
            ),
          ),
        );
      },
    );
  }
}
