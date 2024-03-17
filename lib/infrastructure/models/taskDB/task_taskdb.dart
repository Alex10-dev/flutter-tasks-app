class TaskFromDB {
  final int id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime? completedAt;
  final int userId;

  TaskFromDB({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.completedAt,
    required this.userId,
  });

  factory TaskFromDB.fromJson(Map<String, dynamic> json) => TaskFromDB(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    isCompleted: json["isCompleted"],
    completedAt: json["completedAt"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "isCompleted": isCompleted,
    "completedAt": completedAt,
    "userId": userId,
  };
}
