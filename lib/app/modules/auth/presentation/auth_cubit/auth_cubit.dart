import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/app/core/error/exceptions.dart';
import 'package:frontend/app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoryImpl _repository;

  AuthCubit(this._repository) : super(AuthInitial());

  Future<void> login(String login, String password) async {
    try {
      emit(AuthLoadingState());
      final token =
          await _repository.loginEmail(username: login, password: password);
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('token', token.toString());
      emit(AuthSuccessState());
    } on UserNotFoundException {
      emit(const AuthErrorState('Login ou senha inválido'));
    } catch (e) {
      print(e);
      emit(const AuthErrorState('Erro ao realizar Login'));
    }
  }
}
