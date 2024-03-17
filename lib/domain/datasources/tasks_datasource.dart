
import 'package:task_app/domain/entities/entitites.dart';

abstract class TasksDatasource {

  Future<List<Task>> getAllTasks({ int page = 1, String token = '' });
}