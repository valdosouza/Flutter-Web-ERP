import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? login;

  final String? password;

  const User({
    this.id,
    this.login,
    this.password,
  });
  @override
  List<Object> get props => [User];
}
