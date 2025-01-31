import 'price.dart';
import 'syllabus/syllubus.dart';

class Course {
  final String? id;
  final String name;
  final Price price;
  final Syllabus? syllabus;
  final String bannerImageUri;

  // final List<Assessment> assessments;
  // final List<Resource> meterials;

  Course({
    this.id,
    required this.name,
    required this.price,
    this.syllabus,
    required this.bannerImageUri,
    // required this.assessments,
    // required this.meterials,
    // required super.creatorName,
    // required super.creatorRef,
    // required super.ownerName,
    // required super.ownerRef,
  });
}
