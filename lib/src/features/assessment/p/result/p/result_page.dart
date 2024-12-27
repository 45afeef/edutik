import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/date_time_utils.dart';
import '../../../do/assessment_item.dart';
import '../../controllers/assessment_controller.dart';

class AssessmentResultPage extends StatelessWidget {
  const AssessmentResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO - remove controller dependency and add params and arguments
    AssessmentController controller = Get.find<AssessmentController>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: controller.assessment.value.items.length,
            itemBuilder: (BuildContext context, int index) {
              AssessmentItem item = controller.assessment.value.items[index];
              AssessmentItemResponse? response =
                  controller.assessmentResult.value.getItemResponse(index);

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('${index + 1}) ${item.question}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(response?.currectAnswer ?? "The Currect Answer"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(response?.studentAnswer ?? "-"),
                              Text(
                                response?.timeTakenInMillisecond
                                        .toReadableTimeDelta() ??
                                    "",
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
