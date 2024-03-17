import 'package:task_app/domain/entities/entitites.dart';
import 'package:task_app/infrastructure/models/taskDB/task_taskdb.dart';

class TaskMapper {

  static Task taskDBToEntity( TaskFromDB taskDB ) {
    return Task(
      id: taskDB.id, 
      title: taskDB.title, 
      isCompleted: taskDB.isCompleted, 
      createdBy: taskDB.userId, 
      assignedUsers: [], 
      comments: [], 
      todos: []
    );
  }

}