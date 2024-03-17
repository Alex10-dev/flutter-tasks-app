
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/domain/entities/entitites.dart';
import 'package:task_app/domain/repositories/auth_repository.dart';
import 'package:task_app/presentation/providers/auth/auth_repository_provider.dart';

final authProvider = StateNotifierProvider<AuthNotifier, Auth>((ref) {

  final authRepository = ref.watch( authRepositoryProvider );

  return AuthNotifier(
    authRepository: authRepository
  );
});

class AuthNotifier extends StateNotifier<Auth> {
  
  final AuthRepository authRepository;
  
  AuthNotifier({
    required this.authRepository,
  }): super(
    Auth(
      loggedUser: null,
      token: '', 
      isActive: false
    )
  );

  get getToken {
    return state.token;
  }


  Future<void> login(String username, String password) async {
    // print('se ejecuta: username: $username password:  $password');
    try {
      final result = await authRepository.login(username: username, password: password);
      state = state.copyWith(
        loggedUser: result.loggedUser,
        token: result.token,
        isActive: true,
      );

      print('estado es isActive: ${result.isActive} token: ${result.token}');
    } catch (e) {
      state = state.copyWith(
        isActive: false,
        token: '',
      );
    }
  }

}