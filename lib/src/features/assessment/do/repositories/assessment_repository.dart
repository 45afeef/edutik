import '../../../../../utils/database/repo.dart';
import '../../da/models/assessment_model.dart';
import '../../da/models/assessment_result_model.dart';

abstract class AssessmentRepository extends Repository<AssessmentModel> {
  Future<void> incrementFieldCount({
    required String assessmentId,
    required Map<String, int> data,
  });
}

abstract class AssessmentResultRepository
    extends Repository<AssessmentResultModel> {}
