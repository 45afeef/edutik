import '../../../../../utils/database/database_service.dart';
import '../../../../../utils/database/firestore_service.dart';
import '../../../homepage/do/content.dart';
import '../../do/repo/batch_request_repo.dart';
import '../models/batch_request_model.dart';
import 'batch_repository_impl.dart';
import 'course_repository_impl.dart';

const String _tableOrCollectionName = 'batch_requests';

class BatchRequestRepositoryImpl implements BatchRequestRepository {
  final DatabaseService databaseService;

  BatchRequestRepositoryImpl(this.databaseService);

  @override
  Future<void> create(BatchRequestModel model) async {
    var dataSourcePath = databaseService is FirebaseService
        ? '$kCourseTableName/${model.courseId}/$kBatchTableName/${model.batchId}/$_tableOrCollectionName'
        : _tableOrCollectionName;

    return await databaseService.addData(
      collection: dataSourcePath,
      data: model.toJson(),
    );
  }

  @override
  Future<void> delete(String modelId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<BatchRequestModel>> readAll(String couserIdandbatchId,
      {UserType? ownerType}) async {
    assert(couserIdandbatchId.contains('/'),
        'couserIdandbatchId must contain a / separator between courseId and batchId');

    var courseId = couserIdandbatchId.split('/')[0];
    var batchId = couserIdandbatchId.split('/')[1];

    var dataSourcePath = databaseService is FirebaseService
        ? '$kCourseTableName/$courseId/$kBatchTableName/$batchId/$_tableOrCollectionName'
        : _tableOrCollectionName;

    var input = await databaseService.getAllData(
      collection: dataSourcePath,
    );

    var output = input.map((e) => BatchRequestModel.fromJson(e)).toList();

    return output;
  }

  @override
  Future<BatchRequestModel> readOne(String modelId, {UserType? ownerType}) {
    // TODO: implement readOne
    throw UnimplementedError();
  }

  @override
  Future<void> update(String modelId, json) async {
    // Adding assertions to validate the parameters
    assert(json.containsKey('courseId'), 'couserId is required');
    assert(json.containsKey('batchId'), 'batchId is required');

    if (databaseService is! FirebaseService)
      // TODO: implement update
      throw UnimplementedError();

    var courseId = json.remove('courseId');
    var batchId = json.remove('batchId');

    var dataSourcePath = databaseService is FirebaseService
        ? '$kCourseTableName/$courseId/$kBatchTableName/$batchId/$_tableOrCollectionName'
        : _tableOrCollectionName;

    return await databaseService.updateData(
      collection: dataSourcePath,
      documentId: modelId,
      data: json,
    );
  }
}
