import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/app/core/error/exceptions.dart';
import 'package:frontend/app/core/error/failures.dart';
import 'package:frontend/app/core/usecase/usecase.dart';
import 'package:frontend/app/modules/auth/data/model/auth_model.dart';
import 'package:frontend/app/modules/auth/domain/repositories/auth_repository.dart';

class LoginEmail implements UseCase<AuthModel, Params> {
  final AuthRepository repository;

  LoginEmail({required this.repository});

  @override
  Future<Either<Failure, AuthModel>> call(Params params) async {
    try {
      final logemail = await repository.loginEmail(
          username: params.username, password: params.password);

      return logemail;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  const Params({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}
