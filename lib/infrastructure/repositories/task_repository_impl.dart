
import 'package:task_app/domain/datasources/tasks_datasource.dart';
import 'package:task_app/domain/entities/task.entity.dart';
import 'package:task_app/domain/repositories/tasks_repository.dart';

class TaskRepositoryImpl extends TasksRepository {

  final TasksDatasource datasource;

  TaskRepositoryImpl({required this.datasource});

  @override
  Future<List<Task>> getAllTasks({int page = 1, String token = ''}) {
    return datasource.getAllTasks(page: page, token: token);
  }

}