import '../../../../../utils/database/database_service.dart';
import '../../do/repositories/assessment_repository.dart';
import '../models/assessment_model.dart';

class AssessmentRepositoryImpl implements AssessmentRepository {
  final DatabaseService databaseService;

  AssessmentRepositoryImpl(this.databaseService);

  @override
  Future<List<AssessmentModel>> getAllAssessments() async {
    var input = await databaseService.getAllData(collection: 'assessments');

    var output = input.map((e) => AssessmentModel.fromJson(e)).toList();

    return output;
  }

  @override
  Future<AssessmentModel> getAssessment(String id) async {
    var input = await databaseService.getData(
      collection: 'assessments',
      documentId: id,
    );

    var output = AssessmentModel.fromJson(input);

    return output;
  }

  @override
  Future<void> saveAssessment(AssessmentModel assessmentModel) {
    final data = assessmentModel.toJson();
    return databaseService.addData(
      collection: 'assessments',
      data: data,
    );
  }
}
