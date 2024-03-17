
import 'package:task_app/domain/entities/entitites.dart';

abstract class TasksRepository {

  Future<List<Task>> getAllTasks({ int page = 1, String token = '' });
}