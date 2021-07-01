import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/app/core/error/failures.dart';
import 'package:frontend/app/core/usecase/usecase.dart';
import 'package:frontend/app/modules/auth/domain/entities/user.dart';
import 'package:frontend/app/modules/auth/domain/repositories/auth_repository.dart';

class LoginEmail implements UseCase<User, Params> {
  final AuthRepository repository;

  LoginEmail(this.repository);
  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.loginEmail(
      login: params.login,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  final int? id;
  final String? login;
  final String? password;

  const Params({this.id, this.login, this.password});

  @override
  List<Object> get props => [Params];
}
