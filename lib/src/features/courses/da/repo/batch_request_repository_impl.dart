import '../../../../../utils/database/database_service.dart';
import '../../../../../utils/database/firestore_service.dart';
import '../../../homepage/do/content.dart';
import '../../do/repo/batch_request_repo.dart';
import '../models/batch_request_model.dart';
import 'batch_repository_impl.dart';
import 'course_repository_impl.dart';

const String kBatchRequestsTableName = _tableOrCollectionName;
const String _tableOrCollectionName = 'batch_requests';

class BatchRequestRepositoryImpl implements BatchRequestRepository {
  /// TODO - Read this thread and implement the logic to read from local database first
  /// Use usecases to implement the logic
  /// Even if you are using Firestore, you can still implement the logic to read from local database first
  /// Even we are using Repository pattern, we where not able to switch between multiple data sources.
  /// https://blog.stackademic.com/building-clean-architecture-in-flutter-with-repository-pattern-2af302fc22f2
  final DatabaseService databaseService;

  BatchRequestRepositoryImpl(this.databaseService);

  /// The method creates two documents in two different collections:
  /// - One document in the batch's collection.
  /// - Another document in the user's collection.
  ///
  /// This ensures that the batch request is documented consistently in both the batch
  ///
  /// [model] - The batch request model containing the data to be saved.
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

  /// Deletes a batch request by its [modelId].
  ///
  /// This method is not yet implemented.
  @override
  Future<void> delete(String modelId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  /// Reads all batch requests for a specific course and batch.
  ///
  /// [couserIdandbatchId] - A string containing the courseId and batchId separated by a '/'.
  /// [ownerType] - An optional parameter to specify the owner type.
  ///
  /// Returns a list of [BatchRequestModel] objects.
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

  /// Reads a single batch request by its [modelId].
  ///
  /// This method is not yet implemented.
  @override
  Future<BatchRequestModel> readOne(String modelId, {UserType? ownerType}) {
    // TODO: implement readOne
    throw UnimplementedError();
  }

  /// Reads all pending batch requests for a specific course and batch.
  ///
  /// [courseId] - The ID of the course.
  /// [batchId] - The ID of the batch.
  ///
  /// Returns a list of [BatchRequestModel] objects with a status of 'pending'.
  @override
  Future<List<BatchRequestModel>> readPendingRequests(
      String courseId, String batchId) async {
    var dataSourcePath = databaseService is FirebaseService
        ? '$kCourseTableName/$courseId/$kBatchTableName/$batchId/$_tableOrCollectionName'
        : _tableOrCollectionName;

    var input = await databaseService.getAllData(
      collection: dataSourcePath,
      query: {'status': 'pending'},
    );

    var output = input.map((e) => BatchRequestModel.fromJson(e)).toList();

    return output;
  }

  /// Updates a batch request by its [modelId] with the provided [json] data.
  ///
  /// [modelId] - The ID of the batch request to be updated.
  /// [json] - A map containing the data to update.
  ///
  /// This method adds assertions to validate the parameters and updates the data
  /// in the appropriate collection.
  @override
  Future<void> update(String modelId, json) async {
    // Adding assertions to validate the parameters
    assert(json.containsKey('courseId'), 'couserId is required');
    assert(json.containsKey('batchId'), 'batchId is required');

    if (databaseService is! FirebaseService) {
      // TODO: implement update
      throw UnimplementedError();
    }

    dynamic courseId = json.remove('courseId');
    dynamic batchId = json.remove('batchId');

    String dataSourcePath = databaseService is FirebaseService
        ? '$kCourseTableName/$courseId/$kBatchTableName/$batchId/$_tableOrCollectionName'
        : _tableOrCollectionName;

    return await databaseService.updateData(
      collection: dataSourcePath,
      documentId: modelId,
      data: json,
    );
  }
}
