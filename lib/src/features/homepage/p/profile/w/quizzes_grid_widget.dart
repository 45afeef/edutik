import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    (e) => InkWell(
                      onTap: () => Get.toNamed(AppRoute.assessmentPage),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        color: Colors.primaries[snapshort.data!.indexOf(e) %
                            Colors.primaries.length],
                        height: 150.0,
                        child: Center(
                          child: Text(
                            e.name,
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
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
