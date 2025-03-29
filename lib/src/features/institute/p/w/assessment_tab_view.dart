import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/routing/approute.dart';
import '../../../../widgets/empty_item.dart';
import '../../../../widgets/loading.dart';
import '../../../assessment/do/assessment.dart';
import '../../../assessment/p/result/p/leader_boad_page.dart';
import '../../../authentication/auth_service.dart';
import '../../da/repo/institute_reopsitory_impl.dart';
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CustomProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('some_error_occoured_during_data_fetch'.tr),
            );
          }

          final allAssessments = snapshot.data ?? [];
          final publicAssessments = allAssessments
              .where((assessment) =>
                  institute.publicAssessmentRefs?.contains(assessment.id) ??
                  false)
              .toList();
          List<Assessment> privateAssessments = _isAdmin()
              ? allAssessments
                  .where(
                      (assessment) => !publicAssessments.contains(assessment))
                  .toList()
              : [];

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('public_assessments'.tr),
                _AssessmentList(
                  assessments: publicAssessments,
                  emptyMessage: 'public_assessments'.tr,
                  trailingBuilder: _isAdmin()
                      ? (assessment) => IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () {
                              controller
                                  .removeAssessmentFromPublic(assessment.id!);
                            },
                          )
                      : null,
                ),
                if (_isAdmin()) ...[
                  _buildSectionTitle('private_assessments'.tr),
                  _AssessmentList(
                    assessments: privateAssessments,
                    emptyMessage: 'private_assessments'.tr,
                    instituteId: institute.id,
                    trailingBuilder: (assessment) => IconButton(
                      icon: const Icon(Icons.public),
                      onPressed: () {
                        controller.addAssessmentToPublic(assessment.id!);
                      },
                    ),
                  ),
                ],
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
                  'ownerName': institute.name,
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  bool _isAdmin() {
    final AuthService auth = AuthService();
    return institute.editors.contains(auth.currentUser?.uid);
  }
}

class _AssessmentList extends StatelessWidget {
  final List<Assessment> assessments;
  final String emptyMessage;
  final Widget Function(Assessment)? trailingBuilder;
  final String? instituteId;

  const _AssessmentList({
    required this.assessments,
    required this.emptyMessage,
    this.trailingBuilder,
    this.instituteId,
  });

  @override
  Widget build(BuildContext context) {
    if (assessments.isEmpty) {
      return EmptyItem(itemName: emptyMessage);
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: assessments.length,
      itemBuilder: (BuildContext context, int index) {
        final assessment = assessments[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              leading: Text('${index + 1}'),
              title: Text(assessment.name),
              onLongPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LeaderboardPage(
                      assessmentId: assessment.id!,
                      utmSource: 'institute-profile',
                    ),
                  ),
                );
              },
              onTap: () {
                Get.toNamed(
                  AppRoute.assessmentPage
                      .replaceFirst(':id', '${assessment.id}'),
                  parameters: {
                    'utm_source': 'institute-profile',
                    if (instituteId != null)
                      'campaign': '$kInstituteTableName/$instituteId',
                  },
                );
              },
              trailing:
                  trailingBuilder != null ? trailingBuilder!(assessment) : null,
            ),
          ),
        );
      },
    );
  }
}
