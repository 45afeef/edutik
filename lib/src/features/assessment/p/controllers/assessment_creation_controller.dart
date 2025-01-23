import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/database/local_sqlite_service.dart';
import '../../../authentication/auth_service.dart';
import '../../da/models/assessment_model.dart';
import '../../do/assessment.dart';
import '../../do/assessment_item.dart';
import '../../do/closed_ended/mcq.dart';
import '../../do/repositories/assessment_repository.dart';

class AssessmentDraftController extends GetxController {
  final SqLiteService _databaseService = SqLiteService();
  final AuthService _auth = AuthService();

  final TextEditingController assessmentNameController =
      TextEditingController();

  RxList<Map<String, dynamic>> questions = <Map<String, dynamic>>[].obs;

  Future<void> addQuestion(AssessmentItem item) async {
    if (item is MCQ) {
      var data = {
        'question': item.question,
        'answer': item.answer,
      };
      for (var i = 0; i < item.options.length; i++) {
        if (i > 9) break;
        data['option${i + 1}'] = item.options[i];
      }

      await _databaseService.addData(collection: 'mcq', data: data);
    }

    _loadQuestions();
  }

  void addQuestions(response) {
    // Convert the JSON string to a Dart Map
    // Map<String, dynamic> assessmentJson = jsonDecode(response);

    // List<dynamic> parsedAssessmentItems = assessmentJson['items'];
    List<dynamic> parsedAssessmentItems = _parseAIResponse(response);

    for (var parsedItems in parsedAssessmentItems) {
      MCQ mcq = MCQ(
        question: parsedItems['question'],
        answer: parsedItems['answer'],
        options: (parsedItems['options'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      );
      addQuestion(mcq);
    }
  }

  void deleteAssessmentDataFromDraftTable() {
    _databaseService.deleteAllData(collection: 'mcq');
  }

  @override
  void onInit() {
    super.onInit();
    _loadQuestions();
  }

  // Currently we assume that the owner is an institute when the ownerId and onwerName is supplied,
  // Otherwise the owner is considered as an individual user.
  // TODO - If possible move this creator and ownerRef identification logic to respected database repositories. Move from controller.
  Future<void> saveAssessment(String? ownerId, String? ownerName) async {
    // Input validation
    if (assessmentNameController.text.isEmpty) {
      Get.snackbar(
        'Name is missing',
        'Choose the right name for the assessment before saving',
      );
      return;
    }

    final AssessmentRepository repo = Get.find<AssessmentRepository>();

    final assessmentModel = AssessmentModel(
        name: assessmentNameController.text,
        type: AssessmentType.formative,
        items: [
          ...questions.map((q) {
            return MCQ(
              question: q['question'],
              answer: q['answer'],
              options: [q['option1'], q['option2'], q['option3'], q['option4']],
            );
          })
        ],
        creatorName: 'users/${_auth.currentUser!.displayName!}',
        creatorRef: 'users/${_auth.currentUser!.uid}',
        ownerName: ownerName != null
            ? 'institutes/$ownerName'
            : 'users/${_auth.currentUser!.displayName!}',
        ownerRef: ownerId != null
            ? 'institutes/$ownerId'
            : 'users/${_auth.currentUser!.uid}');

    await repo.saveAssessment(assessmentModel);

    // Delete the Assessment details from the local draft (db)
    deleteAssessmentDataFromDraftTable();

    Get.back();

    return;
  }

  Future<void> updateQuestion(Map<String, dynamic> question) async {
    await _databaseService.updateData(
      collection: 'mcq',
      documentId: question['id'].toString(),
      data: question,
    );
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final data = await _databaseService.getAllData(collection: 'mcq');

    questions.assignAll(data);
  }

  List<Map<String, dynamic>> _parseAIResponse(String response) {
    final jsonRegex = RegExp(r'(\{.*\})', dotAll: true);
    final match = jsonRegex.firstMatch(response);

    if (match != null) {
      final jsonString = match.group(1)!;
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);
      final List<Map<String, dynamic>> items =
          List<Map<String, dynamic>>.from(jsonResponse['items']);
      return items;
    } else {
      return [];
    }
  }
}
