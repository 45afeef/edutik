import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '/utils/date_time_utils.dart';
import '/utils/routing/approute.dart';
import '../../../authentication/auth_service.dart';
import '../../../homepage/do/content.dart';
import '../../../homepage/p/profile/da/profile_repository_impl.dart';
import '../../da/mapper/assessment_result_firestore_mapper.dart';
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
  final AssessmentResultRepository _assessmentResultRepo =
      Get.find<AssessmentResultRepository>();

  /// Holds the result of the assessment, including user inputs and time taken per question
  late Rx<AssessmentResult> assessmentResult;

  /// Holds the current assessment being taken
  Rx<Assessment> assessment = Assessment.empty().obs;

  /// Tracks the index of the current question being displayed
  Rx<int> currentQuestionIndex = (-1).obs;

  /// Timer for tracking time spent on each question
  Timer? _timer;

  /// Cache for storing assessments based on assessment ID
  Map<String, Assessment> assessmentCache = {};

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
      // Check if the response is not null and has a student answer
      // This is becasue there is a
      //  Positive marks for correct answer and
      //  Negative marks for wrong answer.
      //  No marks for skipped questions.
      if (response.studentAnswer != null) {
        if (response.studentAnswer == response.currectAnswer) {
          totalMarks += 3; // Assuming each question has 1 mark
        } else {
          totalMarks -= 1;
        }
      }
    }

    return double.parse((totalMarks / 3).toStringAsFixed(2));
  }

  /// Fetches all available assessments from the repository
  Future<List<Assessment>> fetchAllAssessments(
    String ownerId,
    UserType ownerType, {
    int limit = 5,
  }) async {
    // Filter the cache to find assessments matching the ownerId and ownerType
    List<Assessment> cachedAssessments =
        assessmentCache.values.where((assessment) {
      return assessment.ownerRef == '${ownerType.name}s/$ownerId';
    }).toList();

    if (cachedAssessments.isNotEmpty) {
      return cachedAssessments;
    }

    // If not in the cache, make the network request
    List<Assessment> response = await _repo.readAll(
      ownerId,
      ownerType: ownerType,
      limit: limit,
    );

    // Update the cache with the new response
    for (var assessment in response) {
      assessmentCache[assessment.id!] = assessment;
    }

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

  /// Fetch assessment Results by id, with optional params like 'utm_source' and 'campaign'
  Future<List<AssessmentResult>> fetchAssessmentResult(
    String assessmentId, {
    String? utmSource,
    String? campaign,
  }) async {
    var resultModelList = await _assessmentResultRepo.readAll(
      assessmentId,
      query: {
        if (utmSource != null) 'utmSource': utmSource,
        if (campaign != null) 'campaign': campaign,
      },
      limit: 20,
    );

    var resultEntityList =
        resultModelList.map((m) => AssessmentResultMapper.toEntity(m)).toList();

    return resultEntityList;
  }

  /// Fetches public assessments by their full reference
  Future<List<Assessment>> fetchPublicAssessmentsByRef(
      List<String>? assessmentIds) async {
    if (assessmentIds == null || assessmentIds.isEmpty) {
      return [];
    }

    List<Assessment> publicAssessments = [];
    for (String id in assessmentIds) {
      Assessment assessment = await fetchAssessment(id);
      publicAssessments.add(assessment);
    }

    return publicAssessments;
  }

  /// Gets the student's selection for a given assessment item
  String? getSelectionFor(AssessmentItem item) {
    final index = assessment.value.items.indexOf(item);
    return assessmentResult.value.studentResponse[index]?.studentAnswer;
  }

  void handleAssessmentSharing(Assessment assessment) {
    // Share the assessment link with a message
    // https://edutik.web.app/assessment/123?utm_source=facebook&campaign=spring_sale
    // https://edutik.web.app/assessment/123?utm_source=social&campaign=users/1234567890

    Uri assessmentUri = Uri(
      scheme: 'https',
      host: 'edutik.web.app',
      path: AppRoute.assessmentPage.replaceFirst(':id', assessment.id!),
      queryParameters: {
        'utm_source': 'social',
        'campaign': '$kUsersTableName/${AuthService().currentUser?.uid}',
      },
    );

    Share.share(
      '*${assessment.name.trim()}*\n\n${'msg_attempt_for_free'.tr}\n${assessmentUri.toString()}',
      subject: 'msg_assessment_share_subject'.tr,
    );
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

  // Reset all variables
  void reset() {
    assessmentResult = AssessmentResult().obs;
    currentQuestionIndex.value = -1;
  }

  void saveResult() {
    // add mark optained by the student to the assessment result
    assessmentResult.value.scoredMark = calculateTotalMarks();

    // Convert the assessment result to a model
    final assessmentResultModel =
        AssessmentResultMapper.fromEntity(assessmentResult.value);

    _assessmentResultRepo.create(assessmentResultModel);

    // Increment the submissions count for the assessment
    _repo.incrementFieldCount(
      assessmentId: assessment.value.id!,
      data: {
        'submissionsCount': 1,
        'submissionsCount-${assessmentResult.value.utmSource}-${Uri.encodeComponent(assessmentResult.value.campaign ?? '')}':
            1, // Increment the count for the specific source
      },
    );
  }

  /// Starts the exam and initializes the timer
  void startExam({
    String? utmSource,
    String? campaign,
  }) {
    if (assessment.value == Assessment.empty()) return;

    var currentUser = AuthService().currentUser;
    var studentId = currentUser?.uid;
    if (studentId == null) return;
    var studentName = currentUser?.displayName;

    // Initialize the assessment result with the current assessment
    assessmentResult = AssessmentResult(
      initialResponse: {},
      assessmentId: assessment.value.id,
      studentId: studentId,
      utmSource: utmSource,
      campaign: campaign,
      studentName: studentName,
    ).obs;

    currentQuestionIndex.value = 0;

    // Start or reset the timer when the exam starts
    _timer?.cancel();
    _timer = Timer.periodic(1.seconds, (_) => _updateElapsedTime());

    // Increment the attempts count for the assessment
    _repo.incrementFieldCount(
      assessmentId: assessment.value.id!,
      data: {
        'attemptsCount': 1,
        'attemptsCount-$utmSource-${Uri.encodeComponent(campaign ?? '')}':
            1, // Increment the count for the specific source
      },
    );
  }

  /// Stops the exam and cancel the timer
  void stopExam() {
    currentQuestionIndex.value = -1;

    // Cancel the timer to prevent memory leaks
    _timer?.cancel();
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
