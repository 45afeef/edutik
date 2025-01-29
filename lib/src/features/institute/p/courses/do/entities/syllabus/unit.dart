import 'lesson.dart';

class Unit {
  final String id;
  final String name;
  final String description;
  final Duration duration;
  final List<Lesson> lessons;

  Unit({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.lessons,
  });
}
