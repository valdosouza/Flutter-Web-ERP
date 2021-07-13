import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/app/core/error/failures.dart';
import 'package:frontend/app/core/usecase/usecase.dart';
import 'package:frontend/app/modules/auth/data/model/auth_model.dart';
import 'package:frontend/app/modules/auth/domain/entities/auth_entity.dart';
import 'package:frontend/app/modules/auth/domain/repositories/auth_repository.dart';

class LoginEmailUseCase implements UseCase<AuthEntity, Params> {
  final AuthRepository repository;

  LoginEmailUseCase({required this.repository});

  @override
  Future<Either<Failure, AuthEntity>> call(Params params) async {
    return repository.loginEmail(
        username: params.authModel.username,
        password: params.authModel.password);
  }
}

class Params extends Equatable {
  final AuthModel authModel;

  const Params(this.authModel);

  @override
  List<Object?> get props => [authModel];
}
