import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/routing/approute.dart';
import '../../../assessment/do/assessment.dart';
import '../../../authentication/auth_service.dart';
import '../../../homepage/p/w/empty_item.dart';
import '../../../homepage/p/w/loading.dart';
import '../../do/entity/institute.dart';
import '../controllers/institute_controller.dart';

class AssessmentTabBarView extends GetWidget<InstituteController> {
  final Institute institute;

  const AssessmentTabBarView(this.institute, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Assessment>>(
        future: _isAdmin()
            ? controller.fetchInstitutesAssessments()
            : controller.fetchPublicAssessments(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('some_error_occoured_during_data_fetch'.tr),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CustomProgressIndicator());
          }

          List<Assessment> allAssessments = snapshot.data!;
          List<Assessment> publicAssessments = allAssessments
              .where((assessment) =>
                  institute.publicAssessmentRefs!.contains(assessment.id))
              .toList();
          List<Assessment> privateAssessments = _isAdmin()
              ? allAssessments
                  .where(
                      (assessment) => !publicAssessments.contains(assessment))
                  .take(4)
                  .toList()
              : [];

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
                                title: Text(assessment.name),
                                onTap: () {
                                  Get.toNamed(
                                    AppRoute.assessmentPage.replaceFirst(
                                        ':id', '${assessment.id}'),
                                  );
                                },
                                trailing: _isAdmin()
                                    ? IconButton(
                                        icon: const Icon(Icons.remove_circle),
                                        onPressed: () {
                                          controller.removeAssessmentFromPublic(
                                              assessment.id!);
                                        },
                                      )
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                if (_isAdmin()) ...[
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
                                  trailing: IconButton(
                                    icon: const Icon(Icons.public),
                                    onPressed: () {
                                      controller.addAssessmentToPublic(
                                          assessment.id!);
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ],
            ),
          );
        },
      ),
      // Add new assessment button for admin
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
