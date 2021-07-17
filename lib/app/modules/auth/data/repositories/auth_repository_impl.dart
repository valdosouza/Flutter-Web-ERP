import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';

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
      print("AuthRepositoryImpl");
      final result = await datasource.getAuthentication(
          username: username,
          password: md5.convert(utf8.encode(password)).toString());
      /*
      const result = AuthModel(
        id: 1,
        username: "valdo@setes.com.br",
        password: "",
        jwt:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImlkIjoxLCJlbWFpbCI6InZhbGRvQHNldGVzLmNvbS5iciIsInBhc3N3b3JkIjoiODI3Q0NCMEVFQThBNzA2QzRDMzRBMTY4OTFGODRFN0IifSwiaWF0IjoxNjI2NTMxMzAxLCJleHAiOjE2Mjc4MjczMDF9._p5zMhcVLL_sAGyPtsgIzAEdyXnGv-4NugxKmYXO2iA",
      );*/
      print("Resultado:");
      return Right(result);
    } on Exception {
      return Left(throw UnimplementedError());
    }
  }
}
