
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/domain/repositories/auth_repository.dart';
import 'package:task_app/presentation/providers/auth/auth_repository_provider.dart';

class RegisterFormState {
  
  final String username;
  final String password;
  final String name;
  final String? surname;

  const RegisterFormState({
    this.name= '',
    this.password = '',
    this.username = '',
    this.surname = '',
  });

  RegisterFormState copyWith({
    String? username, 
    String? password, 
    String? name,
    String? surname,
  }) {
    return RegisterFormState(
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }
  
}

final registerFormProvider = StateNotifierProvider<RegisterFormNotifier, RegisterFormState>((ref) {
  
  final authRepository = ref.read(authRepositoryProvider);
  return RegisterFormNotifier(authRepository: authRepository);
});

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {

  final AuthRepository authRepository;

  RegisterFormNotifier({required this.authRepository}) : super(const RegisterFormState());

  get getUsername => state.username;
  
  get getPassword => state.password;

  get getName => state.name;

  get getSurname => state.surname;
  
  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setSurname(String surname) {
    state = state.copyWith(surname: surname);
  }
}