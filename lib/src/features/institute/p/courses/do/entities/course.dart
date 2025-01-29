import 'price.dart';
import 'syllabus/syllubus.dart';

class Course {
  final String name;
  final Price price;
  final Syllabus syllabus;
  // References or foreign keys
  final List<String> videos;
  // final List<Assessment> assessments;
  // final List<Resource> meterials;

  Course({
    required this.name,
    required this.price,
    required this.syllabus,
    required this.videos,
    // required this.assessments,
    // required this.meterials,
    // required super.creatorName,
    // required super.creatorRef,
    // required super.ownerName,
    // required super.ownerRef,
  });
}
