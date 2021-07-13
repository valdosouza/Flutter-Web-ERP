import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:frontend/app/modules/auth/data/model/auth_model.dart';
import 'package:frontend/app/modules/auth/domain/usescases/login_email_usecase.dart';

import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final LoginEmailUseCase authUseCase;

  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is CheckAuthEvent) {
      yield CheckingAuthState();
      final result = await authUseCase.call(
        Params(AuthModel(
            id: 0,
            username: event.login.username,
            password: event.login.password,
            jwt: '')),
      );
      yield result.fold(
        (failure) => ErrorLoggedState(),
        (value) => (value.jwt != '') ? LoggedState() : ErrorLoggedState(),
      );
    }
  }
}
