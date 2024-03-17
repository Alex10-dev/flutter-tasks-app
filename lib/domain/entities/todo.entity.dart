
class Todo {
  final int id;
  final String description;
  final bool isCompleted;
  final DateTime? completedAt;

  Todo({
    required this.id,
    required this.description,
    required this.isCompleted,
    this.completedAt,
  });
}