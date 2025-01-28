import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/routing/approute.dart';
import '../../homepage/p/w/loading.dart';
import '../do/assessment.dart';
import '../do/assessment_item.dart';
import '../do/closed_ended/flashcard.dart';
import '../do/closed_ended/match_the_following.dart';
import '../do/closed_ended/mcq.dart';
import '../do/open_ended/one_word.dart';
import 'controllers/assessment_controller.dart';
import 'widgets/assessment_widget.dart';
import 'widgets/completed.dart';
import 'widgets/flash_card.dart';
import 'widgets/match_the_tollowing_widget.dart';
import 'widgets/mcq.dart';
import 'widgets/one_word_question_widget.dart';
import 'widgets/unsupported_assessment_type.dart';

class AssessmentPage extends GetWidget<AssessmentController> {
  const AssessmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // handle the UI of each assessment item based on type
    AssessmentWidget buildAssessmentWidget(AssessmentItem assessmentItem) {
      if (assessmentItem is MCQ) {
        return MCQWidget(
          item: assessmentItem,
          selectedAnswer: controller.getSelectionFor(assessmentItem),
          onResponse: (res) => controller.handleStudentResponse(res, context),
        );
      }
      if (assessmentItem is FlashCard) {
        return FlashCardWidget(
          item: assessmentItem,
          onResponse: (res) => controller.handleStudentResponse(res, context),
        );
      }
      if (assessmentItem is OneWordQuestion) {
        return OneWordQuestionWidget(
          item: assessmentItem,
          onResponse: (res) => controller.handleStudentResponse(res, context),
        );
      }
      if (assessmentItem is MatchTheFollowing) {
        return MatchTheFollowingWidget(
          item: assessmentItem,
          onResponse: (res) => controller.handleStudentResponse(res, context),
        );
      }

      // Unsupported AssessmentItem type
      return UnSupportedAssessmentItemTypeWidget();
    }

    final String assessmentId =
        Get.parameters['id']!; // Updated to use Get.parameters

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<Assessment>(
            future: controller.fetchAssessment(assessmentId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Card(
                  child: Text(
                    '${'msg_error_loading_assessment'.tr}.${snapshot.error}',
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const CustomProgressIndicator();
              }

              return Obx(() => !controller.isExamStarted
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("msg_confirm_exam".tr),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: controller.startExam,
                          child: Text("lbl_start_exam".tr),
                        ),
                      ],
                    )
                  : Column(
                      children: controller.assessment.value.items.isEmpty
                          ? [Center(child: Text('lbl_no_questions_found'.tr))]
                          : [
                              LinearProgressIndicator(
                                value: (controller.currentQuestionIndex.value +
                                        1) /
                                    controller.assessment.value.items.length,
                              ),
                              Expanded(
                                child: PageView(
                                  onPageChanged: (value) {
                                    // Update the current question.
                                    // Why this check - to make sure the last page is shown well, as the last page is not a question page, but a submit page.
                                    if (value.isLowerThan(controller
                                        .assessment.value.items.length)) {
                                      controller.currentQuestion = value;
                                    }
                                    HapticFeedback.mediumImpact();
                                  },
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ...controller.assessment.value.items.map(
                                      (assessmentItem) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: buildAssessmentWidget(
                                                assessmentItem)),
                                      ),
                                    ),
                                    CompletedWidget(onComplete: () {
                                      Get.toNamed(AppRoute.resultPage);
                                    })
                                  ],
                                ),
                              ),
                            ],
                    ));
            },
          ),
        ),
      ),
    );
  }
}
