import '../../../../../homepage/p/profile/do/entity/user_profile.dart';
import 'course.dart';
import 'syllabus/resource.dart';

class BatchEntity {
  final Course course;
  final int startDate;
  final int endDate;
  // References or foreign keys
  final List<UserProfile> students;
  final List<UserProfile> teachers;
  // Optional references
  final List<UserProfile>? mentors;
  final List<dynamic>? events;
  final List<dynamic>? achivements;

  /// {assessments} is the extension of assessments field of the course ,
  /// which means that, special assessments specific to this batch will be stored here,
  /// while all common assessment of the course  is always sholud save in course  itself
  /// assessments field in both course Entity and BatchEntity must be mutually exclusive
  final List<String>? assessments;

  /// {materials} is a extension of the same filed from course ,
  /// Only those meterials that are specific to this batch should be added here.
  /// All common materials to the course  should not added here but should be in course  field,
  /// materials field in both course Entity and BatchEntity must be mutually exclusive
  final List<Resource>? meterials;

  BatchEntity({
    required this.course,
    required this.startDate,
    required this.endDate,
    required this.students,
    required this.teachers,
    this.mentors,
    this.events,
    this.achivements,
    this.assessments,
    this.meterials,
  });
}
