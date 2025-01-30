import '../../../homepage/do/content.dart';
import '../../da/models/course_model.dart';

abstract class CourseRepository {
  Future<void> createCourse(CourseModel courseModel);
  Future<void> deleteCourse(String id);
  Future<List<CourseModel>> fetchAllCourse(
    String ownerId,
    UserType ownerType,
  );
  Future<CourseModel> fetchCourse(String id);
  Future<void> updateCourse(String id, CourseModel shorts);
}
