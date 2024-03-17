
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/infrastructure/datasources/auth_datasource.dart';
import 'package:task_app/infrastructure/repositories/auth_repository_impl.dart';

final authRepositoryProvider = Provider((ref) {

  return AuthRepositoryImpl(datasource: AuthDatasourceImpl());
});