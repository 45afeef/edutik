import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/routing/approute.dart';
import '../../../assessment/do/assessment.dart';
import '../../../authentication/auth_service.dart';
import '../../../homepage/p/w/empty_item.dart';
import '../../do/entity/institute.dart';
import '../controllers/institute_controller.dart';

class AssessmentTabBarView extends GetWidget<InstituteController> {
  final Institute institute;

  const AssessmentTabBarView(this.institute, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Assessment>>(
        future: controller.fetchInstitutesAssessments(),
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
          List<Assessment> publicAssessments = institute.publicAssessmentRefs !=
                  null
              ? allAssessments
                  .where((assessment) =>
                      institute.publicAssessmentRefs!.contains(assessment.id))
                  .toList()
              : [];
          List<Assessment> privateAssessments = allAssessments
              .where((assessment) => !publicAssessments.contains(assessment))
              .toList();

          return SingleChildScrollView(
            child: Column(
              children: [
                Text('public_assessments'.tr),
                publicAssessments.isEmpty
                    ? EmptyItem(itemName: 'public_assessments'.tr)
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: publicAssessments.length,
                        itemBuilder: (BuildContext context, int index) {
                          final assessment = publicAssessments[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                leading: Text('${index + 1}'),
                                title: const Text('Public Assessment'),
                                onTap: () {
                                  Get.toNamed(
                                    AppRoute.assessmentPage.replaceFirst(
                                        ':id', '${assessment.id}'),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                Text('private_assessments'.tr),
                privateAssessments.isEmpty
                    ? EmptyItem(itemName: 'private_assessments'.tr)
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: privateAssessments.length,
                        itemBuilder: (BuildContext context, int index) {
                          final assessment = privateAssessments[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                leading: Text('${index + 1}'),
                                title: Text(assessment.name),
                                onTap: () {
                                  Get.toNamed(
                                    AppRoute.assessmentPage.replaceFirst(
                                        ':id', '${assessment.id}'),
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
      floatingActionButton: _isAdmin()
          ? FloatingActionButton(
              onPressed: () => Get.toNamed(
                AppRoute.assessmentCreationPage,
                arguments: {
                  'ownerId': institute.id,
                  'ownerName': institute.name
                },
              ),
              child: Tooltip(
                message: 'msg_create_new_assessment'.tr,
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
