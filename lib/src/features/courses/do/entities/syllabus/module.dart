import 'unit.dart';

class Module {
  final String id;
  final String name;
  final String description;
  final Duration duration;
  final List<Unit> units;

  Module({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.units,
  });
}
