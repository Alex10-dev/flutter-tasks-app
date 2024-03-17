
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/infrastructure/datasources/task_datasource.dart';
import 'package:task_app/infrastructure/repositories/task_repository_impl.dart';

final taskRepositoryProvider = Provider((ref) {

  return TaskRepositoryImpl(datasource: TaskDatasource());
});