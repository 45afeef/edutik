import '../../da/models/assessment_model.dart';

abstract class AssessmentRepository {
  Future<List<AssessmentModel>> getAllAssessments();

  Future<AssessmentModel> getAssessment(int id);
}
