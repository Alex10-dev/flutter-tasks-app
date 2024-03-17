
import 'package:task_app/domain/entities/entitites.dart';

class Auth {
  final User? loggedUser;
  final String token;
  final bool isActive;

  Auth({
    required this.loggedUser,
    required this.token,
    required this.isActive,
  });

  Auth copyWith({
    User? loggedUser,
    String? token,
    bool? isActive,
  }) {
    return Auth(
      loggedUser: loggedUser ?? this.loggedUser,
      token: token ?? this.token,
      isActive: isActive ?? this.isActive,
    );
  }
}

