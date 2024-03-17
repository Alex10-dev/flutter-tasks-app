
import 'package:task_app/domain/entities/entitites.dart';

abstract class AuthDatasource {

  Future<Auth> login({ String username, String password });
}