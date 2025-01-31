import '../../../../../utils/database/database_service.dart';
import '../../../homepage/do/content.dart';
import '../../do/repo/course_repo.dart';
import '../models/course_model.dart';

const String _tableOrCollectionName = 'courses';

class CourseRepositoryImpl implements CourseRepository {
  final DatabaseService databaseService;

  CourseRepositoryImpl(this.databaseService);

  // TODO - RETHINK
  // This is copied from AssessmentRepositoryImpl
  // should I move the cache logic to here(assessment repository) from (assessement)controller
  // Now on 11th of Jan 2024, I feel like the cache logic should held in repository and not in controller.
  // If sanctioned, move all cache logic in various controllers to respective repositories.

  @override
  Future<void> create(CourseModel model) async {
    await databaseService.addData(
      collection: _tableOrCollectionName,
      data: model.toJson(),
    );
  }

  @override
  Future<void> delete(String modelId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<CourseModel>> readAll(
    String ownerId, {
    UserType? ownerType,
  }) async {
    var input = await databaseService.getAllData(
      collection: _tableOrCollectionName,
    );

    var output = input.map((e) => CourseModel.fromJson(e)).toList();

    return output;
  }

  @override
  Future<CourseModel> readOne(
    String modelId, {
    UserType? ownerType,
  }) {
    // TODO: implement readOne
    throw UnimplementedError();
  }

  @override
  Future<void> update(String modelId, CourseModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
