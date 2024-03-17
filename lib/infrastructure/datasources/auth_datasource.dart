
import 'package:dio/dio.dart';
import 'package:task_app/config/constants/environment.dart';
import 'package:task_app/domain/datasources/auth_datasource.dart';
import 'package:task_app/domain/entities/auth.entity.dart';
import 'package:task_app/infrastructure/mappers/auth_mapper.dart';
import 'package:task_app/infrastructure/models/auth/authdb_response.dart';

class AuthDatasourceImpl extends AuthDatasource {

  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.hostDB,
    )
  );

  

  @override
  Future<Auth> login({String username = '', String password = ''}) async{

    print('ejecucion username: $username password: $password');
    
    final response = await dio.post(
      '/auth/login',
      data: {
        'username': username,
        'password': password,
      }
    );

    final authDBResponse = AuthDbResponse.fromJson(response.data);

    final Auth authUser = AuthMapper.authDBToEntity(authDBResponse);

    return authUser;
  }

}