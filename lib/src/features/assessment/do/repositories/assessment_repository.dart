import '../../../homepage/do/content.dart';
import '../../da/models/assessment_model.dart';

abstract class AssessmentRepository {
  Future<List<AssessmentModel>> getAllAssessments(
    String ownerId,
    UserType ownerType,
  );

  Future<AssessmentModel> getAssessment(String id);

  Future<void> saveAssessment(AssessmentModel assessmentModel);
}
