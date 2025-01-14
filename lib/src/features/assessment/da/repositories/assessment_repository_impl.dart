import '../../../../../utils/database/database_service.dart';
import '../../do/repositories/assessment_repository.dart';
import '../models/assessment_model.dart';

class AssessmentRepositoryImpl implements AssessmentRepository {
  final DatabaseService databaseService;

  AssessmentRepositoryImpl(this.databaseService);

  // TODO - RETHINK
  // should I move the cache logic to here(assessment repository) from (assessement)controller
  // Now on 11th of Jan 2024, I feel like the cache logic should held in repository and not in controller.
  // If sanctioned, move all cache logic in various controllers to respective repositories.

  @override
  Future<List<AssessmentModel>> getAllAssessments(String ownerId) async {
    var input = await databaseService.queryData(
      collection: 'assessments',
      query: {'creatorRef': ownerId},
    );

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
