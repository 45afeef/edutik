import '../../../../../utils/database/database_service.dart';
import '../../../homepage/do/content.dart';
import '../../do/repo/course_repo.dart';
import '../models/course_model.dart';

const String _tableOrCollectionName = 'courses';

class CourseRepositoryImpl extends CourseRepository {
  final DatabaseService databaseService;

  CourseRepositoryImpl(this.databaseService);

  // TODO - RETHINK
  // This is copied from AssessmentRepositoryImpl
  // should I move the cache logic to here(assessment repository) from (assessement)controller
  // Now on 11th of Jan 2024, I feel like the cache logic should held in repository and not in controller.
  // If sanctioned, move all cache logic in various controllers to respective repositories.

  @override
  Future<void> createCourse(CourseModel courseModel) {
    // TODO: implement createCourse
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCourse(String id) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }

  @override
  Future<List<CourseModel>> fetchAllCourse(String ownerId, UserType ownerType) {
    // TODO: implement fetchAllCourse
    throw UnimplementedError();
  }

  @override
  Future<CourseModel> fetchCourse(String id) {
    // TODO: implement fetchCourse
    throw UnimplementedError();
  }

  @override
  Future<void> updateCourse(String id, CourseModel shorts) {
    // TODO: implement updateCourse
    throw UnimplementedError();
  }
}
