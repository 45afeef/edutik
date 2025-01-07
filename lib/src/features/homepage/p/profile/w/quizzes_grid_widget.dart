import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../utils/routes.dart';
import '../../../../assessment/p/controllers/assessment_controller.dart';

class QuizzesGrid extends GetWidget<AssessmentController> {
  const QuizzesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.fetchAllAssessments(),
        builder: (context, snapshort) {
          if (snapshort.hasError) {
            return Center(
              child: Text('lbl_loading_error'.tr),
            );
          }
          if (snapshort.hasData) {
            return GridView.count(
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: 3,
              children: snapshort.data!
                  .map(
                    (e) => Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          color: Colors.primaries[snapshort.data!.indexOf(e) %
                              Colors.primaries.length],
                          height: 150.0,
                          child: Center(
                            child: TextButton(
                              onPressed: () => Get.toNamed(
                                AppRoute.assessmentPage
                                    .replaceFirst(':id', e.id!),
                              ),
                              child: Text(
                                e.name,
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: IconButton(
                            iconSize: 18,
                            onPressed: () {
                              // TODO - move this code away from UI
                              Share.share(
                                '*${e.name.trim()}* \n\n${'msg_attempt_for_free'.tr} \nhttps://edutik.web.app${AppRoute.assessmentPage.replaceFirst(':id', e.id!)}',
                              );
                            },
                            icon: const Icon(
                              Icons.share,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                  .toList(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
