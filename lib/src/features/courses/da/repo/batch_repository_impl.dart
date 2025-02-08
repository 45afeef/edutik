import '../../../../../utils/database/database_service.dart';
import '../../../../../utils/database/firestore_service.dart';
import '../../../homepage/do/content.dart';
import '../../do/repo/course_repo.dart';
import '../models/batch_model.dart';
import 'course_repository_impl.dart';

const String _tableOrCollectionName = 'batches';

class BatchRepositoryImpl implements BatchRepository {
  final DatabaseService databaseService;

  BatchRepositoryImpl(this.databaseService);

  // TODO - RETHINK
  // This is copied from AssessmentRepositoryImpl
  // should I move the cache logic to here(assessment repository) from (assessement)controller
  // Now on 11th of Jan 2024, I feel like the cache logic should held in repository and not in controller.
  // If sanctioned, move all cache logic in various controllers to respective repositories.

  @override
  Future<void> create(BatchModel model) async {
    var dataSourcePath = databaseService is FirebaseService
        ? '$kCourseTableName/${model.courseId}/$_tableOrCollectionName'
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

  // This function will read all the batches from the firestore database, whcich is inside every course document
  @override
  Future<List<BatchModel>> readAll(String courseId,
      {UserType? ownerType}) async {
    var dataSourcePath = databaseService is FirebaseService
        ? '$kCourseTableName/$courseId/$_tableOrCollectionName'
        : _tableOrCollectionName;

    var input = await databaseService.getAllData(
      collection: dataSourcePath,
    );

    var output = input.map((e) => BatchModel.fromJson(e)).toList();

    return output;
  }

  @override
  Future<BatchModel> readOne(String modelId, {UserType? ownerType}) {
    // TODO: implement readOne
    throw UnimplementedError();
  }

  @override
  Future<void> update(String modelId, json) async {
    if (databaseService is! FirebaseService)
      // TODO: implement update
      throw UnimplementedError();

    var courseId = json.remove('courseId');

    var dataSourcePath = databaseService is FirebaseService
        ? '$kCourseTableName/$courseId/$_tableOrCollectionName'
        : _tableOrCollectionName;

    return await databaseService.updateData(
      collection: dataSourcePath,
      documentId: modelId,
      data: json,
    );
  }
}
