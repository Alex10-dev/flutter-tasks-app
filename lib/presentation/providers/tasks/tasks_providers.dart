
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/domain/entities/entitites.dart';
import 'package:task_app/presentation/providers/tasks/tasks_repository_provider.dart';

final tasksProvider = StateNotifierProvider<TasksNotifier, List<Task>>((ref) {

  final fetchMoreTasks = ref.watch( taskRepositoryProvider ).getAllTasks;

  return TasksNotifier(
    fetchMoreTasks: fetchMoreTasks
  );
});

typedef TaskCallback = Future<List<Task>> Function({ int page, String token });

class TasksNotifier extends StateNotifier<List<Task>> {
  
  int currentPage = 0;
  TaskCallback fetchMoreTasks;
  
  TasksNotifier({
    required this.fetchMoreTasks,
  }): super([]);

  Future<void> loadNextPage( String token ) async{
    currentPage ++;

    final List<Task> tasks = await fetchMoreTasks( page: currentPage, token: token );
    state = [...state, ...tasks];
  }
}