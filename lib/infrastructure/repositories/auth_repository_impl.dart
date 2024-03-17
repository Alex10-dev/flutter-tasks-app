

import 'package:task_app/domain/datasources/auth_datasource.dart';
import 'package:task_app/domain/entities/auth.entity.dart';
import 'package:task_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {

  final AuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Auth> login({String username = '', String password = ''}) {
    return datasource.login(password: password, username: username);
  }

}