import 'user.entity.dart';

class Comment {
  final int id;
  final String message;
  final DateTime createdAt;
  final User createdBy;

  Comment({
    required this.id,
    required this.message,
    required this.createdAt,
    required this.createdBy,
  });
}