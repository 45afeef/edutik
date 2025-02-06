import 'package:get/get.dart';

import '../../../../utils/database/database_service.dart';
import '../../homepage/do/content.dart';
import '../da/models/course_model.dart';
import '../da/repo/batch_repository_impl.dart';
import '../do/entities/batch.dart';
import '../do/entities/course.dart';
import '../do/repo/course_repo.dart';

class CourseController extends GetxController {
  /// Repository for accessing assessment data
  final CourseRepository _repo = Get.find<CourseRepository>();

  /// Cache for storing courses
  Map<String, Course> coursesCache = <String, Course>{};

  /// Fetches all available courses from the repository
  Future<List<Course>> fetchAllCourses(
    String ownerId,
    UserType ownerType,
  ) async {
    // Check if all courses are already in the cache
    // TODO - BAD BEHAVIOUR -  This condition will result in lowers number of http calls,
    // which causes bad behaviour from users pov. even though this is cost effective,
    // this don't give much options to users
    // UPDATE the code in future
    if (coursesCache.isNotEmpty) {
      return coursesCache.values.toList();
    }

    // If not in the cache, make the network request
    List<Course> response = await _repo.readAll(ownerId, ownerType: ownerType);

    // Convert to a map where the key is the id field of each course from list
    coursesCache = {for (var obj in response) obj.id!: obj};

    return response;
  }

  Future<List<BatchEntity>> fetchBatches(String courseId) async {
    // In Firestore batchs are stored as a sub directory(collection) inside each course document
    // and the BatchRepositoryImpl should only be acceced inside the Course Controller,
    // that's why I'm not injected inside the Initial bindings.
    var batchRepo = BatchRepositoryImpl(Get.find<DatabaseService>());

    // TODO Build query depending up

    return batchRepo.readAll(courseId);
  }

  Future<void> saveCourse(CourseModel course) async {
    // You can add extra validation and logic here before saving the data into database
    _repo.create(course);
  }
}
