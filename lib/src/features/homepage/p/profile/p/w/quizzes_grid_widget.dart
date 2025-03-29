import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/src/features/homepage/p/profile/p/profile_controller.dart';
import '/utils/routing/approute.dart';
import '../../../../../../widgets/empty_item.dart';
import '../../../../../../widgets/loading.dart';
import '../../../../../assessment/p/result/p/leader_boad_page.dart';
import '../../da/profile_repository_impl.dart';

class QuizzesGrid extends GetWidget<ProfileController> {
  const QuizzesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.fetchAllAssessments(),
        builder: (context, snapshort) {
          // If the future got error, display an error message
          if (snapshort.hasError) {
            return Center(
              child: Text('lbl_loading_error'.tr),
            );
          }
          // If the future is complete, display the data
          if (snapshort.hasData) {
            if (snapshort.data!.isEmpty) {
              return const EmptyItem(
                itemName: 'quizzes',
                message:
                    'Oh no! Looks like you have never created any quiz in edukit.',
              );
            }
            return GridView.count(
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: 3,
              children: snapshort.data!
                  .map(
                    (assessment) => Container(
                      padding: const EdgeInsets.all(6),
                      color: Colors.primaries[
                          snapshort.data!.indexOf(assessment) %
                              Colors.primaries.length],
                      height: 150.0,
                      child: Stack(
                        children: [
                          Center(
                            child: TextButton(
                              onPressed: () => Get.toNamed(
                                AppRoute.assessmentPage
                                    .replaceFirst(':id', assessment.id!),
                                parameters: {
                                  'utm_source': 'user-profile',
                                  'campaign':
                                      '$kUsersTableName/${controller.userProfile.value.uid}',
                                },
                              ),
                              onLongPress: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => LeaderboardPage(
                                      assessmentId: assessment.id!,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                assessment.name,
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: IconButton(
                              iconSize: 18,
                              onPressed: () {
                                controller.handleAssessmentSharing(assessment);
                              },
                              icon: const Icon(
                                Icons.share,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            );
          }
          // Show a loading indicator while the data is being fetched
          return const Center(
            child: CustomProgressIndicator(),
          );
        });
  }
}
