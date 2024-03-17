
import 'task_taskdb.dart';

class TasksDbResponse {
    final int page;
    final int limit;
    final int total;
    final String? next;
    final String? prev;
    final List<TaskFromDB> tasks;

    TasksDbResponse({
        required this.page,
        required this.limit,
        required this.total,
        required this.next,
        required this.prev,
        required this.tasks,
    });

    factory TasksDbResponse.fromJson(Map<String, dynamic> json) => TasksDbResponse(
        page: json["page"],
        limit: json["limit"],
        total: json["total"],
        next: json["next"] == null ? json["next"] : null,
        prev: json["prev"] == null ? json["prev"] : null,
        tasks: List<TaskFromDB>.from(json["tasks"].map((x) => TaskFromDB.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "total": total,
        "next": next,
        "prev": prev,
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
    };
}

