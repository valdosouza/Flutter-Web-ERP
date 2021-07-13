import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class InitialAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class CheckingAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoggedState extends AuthState {
  @override
  List<Object> get props => [];
}

class ErrorLoggedState extends AuthState {
  @override
  List<Object> get props => [];
}
