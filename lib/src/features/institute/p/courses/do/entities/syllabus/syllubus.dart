import 'module.dart';

class Syllabus {
  final String id;
  final String title;
  final String description;
  final String academicLevel;
  final String language;
  final Duration duration;
  final String createdBy;
  final DateTime updatedAt;
  final List<Module> modules;

  Syllabus({
    required this.id,
    required this.title,
    required this.description,
    required this.academicLevel,
    required this.language,
    required this.duration,
    required this.createdBy,
    required this.updatedAt,
    required this.modules,
  });
}
