
import 'package:task_app/domain/entities/entitites.dart';

abstract class AuthRepository {

  Future<Auth> login({ String username, String password });
}