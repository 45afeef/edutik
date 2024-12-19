import '../../../../../utils/database/database_service.dart';
import '../../do/repositories/assessment_repository.dart';
import '../models/assessment_model.dart';

class AssessmentRepositoryImpl implements AssessmentRepository {
  final DatabaseService databaseService;

  AssessmentRepositoryImpl(this.databaseService);

  @override
  Future<AssessmentModel> getAssessment(int id) async {
    var input = await databaseService.getData(
        collection: 'assessments', documentId: '$id');

    return AssessmentModel.fromJson(input);
  }
}
