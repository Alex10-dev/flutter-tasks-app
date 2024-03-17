import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/domain/repositories/auth_repository.dart';
import 'package:task_app/presentation/providers/auth/auth_repository_provider.dart';

enum FormStatus { invalid, valid, validating, posting }

class LoginFormState {
  final FormStatus formStatus;
  final String username;
  final String password;

  const LoginFormState({
    this.formStatus = FormStatus.invalid, 
    this.username = '', 
    this.password = ''
  });

  // Crear una copia del estado con cambios
  LoginFormState copyWith({String? username, String? password, FormStatus? formStatus}) {
    return LoginFormState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus
    );
  }

  // Aquí podrías agregar más lógica para la validación
  bool get isValid => username.isNotEmpty && password.isNotEmpty;
}


final loginFormProvider = StateNotifierProvider<LoginFormNotifier, LoginFormState>((ref) {
  
  final authRepository = ref.read(authRepositoryProvider);
  return LoginFormNotifier(authRepository: authRepository);
});

class LoginFormNotifier extends StateNotifier<LoginFormState> {

  final AuthRepository authRepository;

  LoginFormNotifier({required this.authRepository}) : super(const LoginFormState());

  get getUsername {
    return state.username;
  }

  get getPassword {
    return state.password;
  }
  
  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }
}