import 'resource.dart';

class Lesson {
  final String id;
  final String title;
  final String content;
  final Duration duration;
  final List<Resource> resources;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.duration,
    required this.resources,
  });
}
