import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/core/error/exceptions.dart';
import 'package:frontend/app/modules/auth/data/model/auth_model.dart';
import 'package:frontend/app/modules/auth/domain/usescases/login_email.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginEmail _loginEmail;

  AuthCubit(this._loginEmail) : super(AuthInitial());

  Future<void> login(String login, String password) async {
    try {
      emit(AuthLoadingState());

      final result =
          await _loginEmail(Params(username: login, password: password));
      final AuthModel authModel = (result as Right).value as AuthModel;
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('token', authModel.auth.toString());
      await sp.setString('institution', authModel.institution.toString());

      emit(AuthSuccessState());
    } on UserNotFoundException {
      emit(const AuthErrorState('Login ou senha inválido'));
    } catch (e) {
      print("Erro: $e");
      emit(const AuthErrorState('Erro ao realizar Login'));
    }
  }

  Future<void> logOut() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('token', '');
    await Modular.to.popAndPushNamed('/');
    emit(AuthLogoutSucessState());
  }
}
