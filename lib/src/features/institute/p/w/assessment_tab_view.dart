import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/routing/approute.dart';

class AssessmentTabBarView extends StatelessWidget {
  final List<String>? assessmentRefs;
  final String? instituteId;
  final String? instituteName;

  const AssessmentTabBarView(
    this.assessmentRefs, {
    this.instituteId,
    this.instituteName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
                  // Navigator.pushNamed(context,
                  Get.toNamed(
                    AppRoute.assessmentPage
                        .replaceFirst(':id', '$assessmentId'),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(
          AppRoute.assessmentCreationPage,
          arguments: {'ownerId': instituteId, 'ownerName': instituteName},
        ),
        child: Tooltip(
          message: 'msg_create_new_assessment'.tr,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
