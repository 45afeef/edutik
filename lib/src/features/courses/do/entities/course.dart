import 'price.dart';
import 'syllabus/syllubus.dart';

class Course {
  final String? id;
  final String name;
  final Price price;
  final Syllabus syllabus;
  final List<String> videos; // References or foreign keys
  final String bannerImageUri;

  // final List<Assessment> assessments;
  // final List<Resource> meterials;

  Course({
    this.id,
    required this.name,
    required this.price,
    required this.syllabus,
    required this.videos,
    required this.bannerImageUri,
    // required this.assessments,
    // required this.meterials,
    // required super.creatorName,
    // required super.creatorRef,
    // required super.ownerName,
    // required super.ownerRef,
  });
}
