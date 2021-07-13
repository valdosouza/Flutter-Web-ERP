import 'package:equatable/equatable.dart';
import 'package:frontend/app/modules/auth/data/model/auth_model.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class CheckAuthEvent extends AuthEvent {
  final AuthModel login;

  CheckAuthEvent(this.login);

  @override
  List<Object> get props => [login];
}
