import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/app/core/error/exceptions.dart';

import 'package:frontend/app/core/error/failures.dart';
import 'package:frontend/app/modules/auth/data/datasource/remote/ownapi/auth_datasource.dart';
import 'package:frontend/app/modules/auth/data/model/auth_model.dart';
import 'package:frontend/app/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;
  //final NetworkInfo networkinfo;
  AuthRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, AuthModel>> loginEmail(
      {required String username, required String password}) async {
    try {
      final logemail = await datasource.getAuthentication(
          username: username,
          password: md5.convert(utf8.encode(password)).toString());

      return Right(logemail);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
