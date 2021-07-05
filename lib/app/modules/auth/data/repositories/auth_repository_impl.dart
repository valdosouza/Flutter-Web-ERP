import 'package:frontend/app/modules/auth/data/datasource/remote/ownapi/auth_datasource.dart';
import 'package:frontend/app/modules/auth/data/model/auth_model.dart';
import 'package:frontend/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/app/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, AuthModel>> loginEmail(
      {required String username, required String password}) async {
    try {
      final result = await datasource.getAuthentication(
          username: username, password: password);
      return Right(result);
    } on Exception {
      return Left(throw UnimplementedError());
    }
  }
}