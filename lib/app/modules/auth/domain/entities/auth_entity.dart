import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String username;
  final String password;
  final String jwt;

  const AuthEntity({
    required this.username,
    required this.password,
    required this.jwt,
  });

  @override
  List<Object?> get props => [username, password, jwt];
}
