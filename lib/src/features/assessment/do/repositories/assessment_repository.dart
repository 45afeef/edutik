import '../../../../../utils/database/repo.dart';
import '../../da/models/assessment_model.dart';
import '../../da/models/assessment_result_model.dart';

abstract class AssessmentRepository extends Repository<AssessmentModel> {}

abstract class AssessmentResultRepository
    extends Repository<AssessmentResultModel> {}
