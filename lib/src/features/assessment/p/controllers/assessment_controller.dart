import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/date_time_utils.dart';
import '../../../homepage/do/content.dart';
import '../../do/assessment.dart';
import '../../do/assessment_item.dart';
import '../../do/closed_ended/mcq.dart';
import '../../do/repositories/assessment_repository.dart';

/// Controller for managing assessments in the application.
/// This class handles fetching assessments, managing current question state,
/// and tracking time spent on each question.
class AssessmentController extends GetxController {
  /// Singleton instance of AssessmentController
  static AssessmentController get call => Get.find();

  /// Repository for accessing assessment data
  final AssessmentRepository _repo = Get.find<AssessmentRepository>();

  /// Holds the result of the assessment, including user inputs and time taken per question
  Rx<AssessmentResult> assessmentResult = AssessmentResult().obs;

  /// Holds the current assessment being taken
  Rx<Assessment> assessment = Assessment.empty().obs;

  /// Tracks the index of the current question being displayed
  Rx<int> currentQuestionIndex = (-1).obs;

  /// Timer for tracking time spent on each question
  Timer? _timer;

  /// Cache for storing assessments
  Map<String, Assessment> assessmentCache = <String, Assessment>{};

  /// Updates the current question index and starts the timer
  set currentQuestion(int index) => currentQuestionIndex.value = index;

  /// Checks if the exam is currently ongoing
  bool get isExamOngoing =>
      currentQuestionIndex.value >= 0 &&
      currentQuestionIndex.value < assessment.value.items.length;

  /// Checks if the exam has started
  bool get isExamStarted => currentQuestionIndex.value != -1;

  /// Gets the time spent on the current question in a readable format
  String get timeSpentOnCurrentQuestion =>
      _getTimeSpentOnQuestion(currentQuestionIndex.value);

  /// Calculates the total marks scored by the student
  /// TODO - Need to calculate the mark based on maximum marks allowed per assessmentItem.
  /// now assuming this valuation is done as how kerala psc validates the marks.
  /// +1 marks for every correct answer
  /// -(1/3) marks for every wrong answer
  /// +0 marks for every skipped questions.
  double calculateTotalMarks() {
    int totalMarks = 0;
    for (var response in assessmentResult.value.studentResponse.values) {
      if (response.studentAnswer == response.currectAnswer) {
        totalMarks += 3; // Assuming each question has 1 mark
      } else {
        totalMarks -= 1;
      }
    }

    return double.parse((totalMarks / 3).toStringAsFixed(2));
  }

  /// Fetches all available assessments from the repository
  Future<List<Assessment>> fetchAllAssessments(
    String ownerId,
    UserType ownerType,
  ) async {
    // Check if all assessments are already in the cache
    // TODO - BAD BEHAVIOUR -  This condition will result in lowers number of http calls,
    // which causes bad behaviour from users pov. even though this is cost effective,
    // this don't give much options to users
    // UPDATE the code in future
    if (assessmentCache.isNotEmpty) {
      return assessmentCache.values.toList();
    }

    // If not in the cache, make the network request
    List<Assessment> response =
        await _repo.readAll(ownerId, ownerType: ownerType);

    // Convert to a map where the key is the id field of each assessment from list
    assessmentCache = {for (var obj in response) obj.id!: obj};

    return response;
  }

  /// Fetches a specific assessment from the repository
  Future<Assessment> fetchAssessment(String assessmentId) async {
    // Check if the assessment is already in the cache
    if (assessmentCache.containsKey(assessmentId)) {
      // Update the current assessment
      assessment.value = assessmentCache[assessmentId]!;
      return assessmentCache[assessmentId]!;
    }

    // If not in the cache, make the network request
    Assessment response = await _repo.readOne(assessmentId);

    // Update the cache with the new response
    assessmentCache[assessmentId] = response;

    // Update the current assessment
    assessment.value = response;

    return response;
  }

  /// Gets the student's selection for a given assessment item
  String? getSelectionFor(AssessmentItem item) {
    final index = assessment.value.items.indexOf(item);
    return assessmentResult.value.studentResponse[index]?.studentAnswer;
  }

  /// Handles the student's response to a question
  void handleStudentResponse(dynamic response, BuildContext context) {
    AssessmentItemResponse itemResponse =
        assessmentResult.value.studentResponse[currentQuestionIndex.value]!;
    itemResponse.updateResponse(response.toString());

    AssessmentItem item = assessment.value.items[currentQuestionIndex.value];
    if (item is MCQ) {
      itemResponse.addCurrectAnswer(item.answer);
    }

    // Display a snackbar with the selected answer
    Get.closeAllSnackbars();
    Get.snackbar('Selected Answer is', response.toString());

    // Notify listeners about the change in assessment result
    assessmentResult.refresh();
  }

  @override
  void onClose() {
    // Stop the exam and clean up resources
    stopExam();
    super.onClose();
  }

  /// Starts the exam and initializes the timer
  void startExam() {
    if (assessment.value == Assessment.empty()) return;

    currentQuestionIndex.value = 0;

    // Start or reset the timer when the exam starts
    _timer?.cancel();
    _timer = Timer.periodic(1.seconds, (_) => _updateElapsedTime());
  }

  /// Stops the exam and resets variables
  void stopExam() {
    // Cancel the timer to prevent memory leaks
    _timer?.cancel();

    // Reset all variables
    assessmentResult = AssessmentResult().obs;
    currentQuestionIndex.value = -1;
  }

  /// Returns the total time spent on a specific question in a readable format
  String _getTimeSpentOnQuestion(int questionIndex) {
    int seconds = assessmentResult
            .value.studentResponse[questionIndex]?.timeTakenInMillisecond ??
        0;
    return seconds.toReadableTimeDelta(pattern: 'm:s');
  }

  /// Updates the elapsed time for the current question
  /// The private method [_updateElapsedTime] is invoked by the timer with an interval of 1 second
  /// so the extra time spent on the current question will always be 1 second more than the previous
  ///
  /// We are not minimizing the interval, because we don't want to compromise performance.
  /// Current method of timer will miscount the time spent because we are using only one timer and
  /// not resetting it for each question.
  ///
  /// This approach aims to balance performance and accuracy.
  void _updateElapsedTime() {
    // Calculate the time spent on the current question
    var timeSpent = 1; // Each interval is 1 second

    // Update the total time for the current question
    if (assessmentResult.value.studentResponse
        .containsKey(currentQuestionIndex.value)) {
      assessmentResult.value.studentResponse[currentQuestionIndex.value]!
          .incrementTimeTaken(
              timeSpent * 1000); // Increment time in milliseconds
    } else {
      AssessmentItemResponse response =
          AssessmentItemResponse(timeTakenInMillisecond: timeSpent * 1000);
      assessmentResult.value
          .setItemResponse(currentQuestionIndex.value, response);
    }
  }
}
