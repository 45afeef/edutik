import '../../../../../utils/database/repo.dart';
import '../../da/models/assessment_model.dart';
import '../../da/models/assessment_result_model.dart';

abstract class AssessmentRepository extends Repository<AssessmentModel> {
  Future<void> incrementFieldCount({
    required String assessmentId,
    required String fieldName,
    int incrementBy = 1,
  }) {
    assert(assessmentId.isNotEmpty, 'assessmentId must not be empty');
    assert(['attemptsCount', 'submissionsCount'].contains(fieldName),
        'Field name must be either "attemptsCount" or "submissionsCount"');

    throw UnimplementedError();
  }
}

abstract class AssessmentResultRepository
    extends Repository<AssessmentResultModel> {}
