import '../../../../../utils/database/database_service.dart';
import '../../../homepage/do/content.dart';
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
  Future<void> delete(String modelId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<AssessmentResultModel>> readAll(String ownerId,
      {UserType? ownerType, int limit = 5}) {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  Future<AssessmentResultModel> readOne(String modelId, {UserType? ownerType}) {
    // TODO: implement readOne
    throw UnimplementedError();
  }

  @override
  Future<void> update(String modelId, Map<String, dynamic> json) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
