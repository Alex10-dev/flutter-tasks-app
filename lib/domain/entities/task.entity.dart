
import 'comment.entity.dart';
import 'todo.entity.dart';
import 'user.entity.dart';

class Task {
  final int id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime? completedAt;
  final int createdBy;
  final List<User> assignedUsers;
  final List<Comment> comments;
  final List<Todo> todos;

  Task({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    this.completedAt,
    required this.createdBy,
    required this.assignedUsers,
    required this.comments,
    required this.todos,
  });
}

