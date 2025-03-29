import '../../../../../utils/database/database_service.dart';
import '../../do/repositories/assessment_repository.dart';
import '../models/assessment_result_model.dart';
import 'assessment_repository_impl.dart';

const String kAssessmentResultsTableName = _tableOrCollectionName;
const String _tableOrCollectionName = 'results';

class AssessmentResultRepositoryImpl extends AssessmentResultRepository {
  final DatabaseService databaseService;

  AssessmentResultRepositoryImpl(this.databaseService);

  // TODO - RETHINK
  // should I move the cache logic to here(repository) from controller
  // Now, I feel like the cache logic should held in repository and not in controller.
  // If sanctioned, move all cache logic in various controllers to respective repositories.

  @override
  Future<void> create(AssessmentResultModel model) async {
    databaseService.addData(
      collection:
          '$kAssessmentsTableName/${model.assessmentId}/$_tableOrCollectionName',
      data: model.toJson(),
    );
  }

  @override
  Future<List<AssessmentResultModel>> readAll(
    String assessmentId, {
    Map<String, dynamic>? query,
    int limit = 10,
  }) async {
    var collectionPath =
        '$kAssessmentsTableName/$assessmentId/$_tableOrCollectionName';

    var input = await databaseService.getAllData(
      collection: collectionPath,
      query: query,
      limit: limit,
    );

    var output = input.map((e) => AssessmentResultModel.fromJson(e)).toList();

    return output;
  }
}
