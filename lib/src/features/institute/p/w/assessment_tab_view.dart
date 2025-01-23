import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/routing/approute.dart';
import '../../../assessment/do/assessment.dart';
import '../../do/entity/institute.dart';
import '../controllers/institute_controller.dart';

class AssessmentTabBarView extends StatelessWidget {
  final Institute institute;

  const AssessmentTabBarView(this.institute, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Assessment>>(
        future: Get.find<InstituteController>().fetchInstitutesAssessments(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('some_error_occoured_during_data_fetch'.tr),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<Assessment> allAssessments = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                Text('public_assessments'.tr),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: institute.publicAssessmentRefs?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final assessmentId = institute.publicAssessmentRefs?[index];

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
                Text('private_assessments'.tr),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allAssessments.length,
                  itemBuilder: (BuildContext context, int index) {
                    final assessment = allAssessments[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          leading: Text('${index + 1}'),
                          title: Text(assessment.name),
                          onTap: () {
                            // Navigate to the assessment page
                            // Navigator.pushNamed(context,
                            Get.toNamed(
                              AppRoute.assessmentPage
                                  .replaceFirst(':id', '${assessment.id}'),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(
          AppRoute.assessmentCreationPage,
          arguments: {'ownerId': institute.id, 'ownerName': institute.name},
        ),
        child: Tooltip(
          message: 'msg_create_new_assessment'.tr,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
