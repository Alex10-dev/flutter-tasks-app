import 'package:task_app/domain/entities/entitites.dart';
import 'package:task_app/infrastructure/models/auth/authdb_response.dart';

class AuthMapper {

  static Auth authDBToEntity( AuthDbResponse authDB ) {
    return Auth(
      token: authDB.token,
      isActive: true,
      loggedUser: User(
        id: authDB.id, 
        username: authDB.username, 
        name: authDB.name,
        surname: authDB.surname,
      )
    );
  }

}