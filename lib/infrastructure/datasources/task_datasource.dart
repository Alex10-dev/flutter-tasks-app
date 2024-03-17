
import 'package:dio/dio.dart';
import 'package:task_app/config/constants/environment.dart';
import 'package:task_app/domain/datasources/tasks_datasource.dart';
import 'package:task_app/domain/entities/task.entity.dart';
import 'package:task_app/infrastructure/mappers/task_mapper.dart';
import 'package:task_app/infrastructure/models/taskDB/taskdb_response.dart';

class TaskDatasource extends TasksDatasource {

  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.hostDB,
    )
  );

  @override
  Future<List<Task>> getAllTasks({int page = 1, String token = ''}) async{
    
  try{
      final response = await dio.get('/tasks', 
        queryParameters: {
          'page': page,
          'limit': 5
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        )
      );

      final taskDBResponse = TasksDbResponse.fromJson(response.data);

      final List<Task> tasks = taskDBResponse.tasks.map(
        ( taskDB ) => TaskMapper.taskDBToEntity(taskDB)
      ).toList();

      return tasks;

    } catch ( error ){
      return [];
    }
  }

}