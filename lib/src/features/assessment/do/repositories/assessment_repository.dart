import '../../da/models/assessment_model.dart';

abstract class AssessmentRepository {
  Future<List<AssessmentModel>> getAllAssessments();

  Future<AssessmentModel> getAssessment(String id);

  Future<void> saveAssessment(AssessmentModel assessmentModel);
}
