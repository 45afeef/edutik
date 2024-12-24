import 'package:get/get.dart';

import '../../../../../utils/database/local_sqlite_service.dart';
import '../../do/assessment_item.dart';
import '../../do/closed_ended/mcq.dart';

class AssessmentCreationController extends GetxController {
  final SqLiteService _databaseService = SqLiteService();

  RxList<Map<String, dynamic>> questions = <Map<String, dynamic>>[].obs;

  Future<void> addQuestion(AssessmentItem item) async {
    if (item is MCQ) {
      var data = {'question': item.question};
      for (var i = 0; i < item.options.length; i++) {
        if (i > 9) break;
        data['option${i + 1}'] = item.options[i];
      }

      await _databaseService.addData(collection: 'mcq', data: data);
    }

    _loadQuestions();
  }

  @override
  void onInit() {
    super.onInit();
    _loadQuestions();
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
}
