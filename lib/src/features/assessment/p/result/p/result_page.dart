import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/date_time_utils.dart';
import '../../../do/assessment_item.dart';
import '../../../do/closed_ended/mcq.dart';
import '../../controllers/assessment_controller.dart';

// In result_page.dart
class AssessmentResultPage extends StatelessWidget {
  const AssessmentResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO - remove controller dependency and add params and arguments
    AssessmentController controller = Get.find<AssessmentController>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${'total_marks_scored'.tr} : ${controller.calculateTotalMarks()}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.assessment.value.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    AssessmentItem item =
                        controller.assessment.value.items[index];
                    AssessmentItemResponse? response = controller
                        .assessmentResult.value
                        .getItemResponse(index);

                    String? answer;
                    if (item is MCQ) {
                      answer = item.answer;
                    }

                    return SizedBox(
                      height: 160,
                      child: FlipCard(
                        front: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('${index + 1}) ${item.question}'),
                                const Spacer(),
                                Text(
                                  response?.studentAnswer ?? "-",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: response!.studentAnswer == null
                                          ? null
                                          : response.studentAnswer ==
                                                  response.currectAnswer
                                              ? Colors.green
                                              : Colors.red),
                                ),
                                Text(
                                  response.timeTakenInMillisecond
                                      .toReadableTimeDelta(),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        ),
                        back: Card(
                          child: Center(
                            child: Text(
                              answer ?? 'correct_answer_unawailable'.tr,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
