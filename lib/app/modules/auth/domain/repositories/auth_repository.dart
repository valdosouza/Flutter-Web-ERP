import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:frontend/app/core/error/failures.dart';
import 'package:frontend/app/modules/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> loginEmail({String? login, String? password});

  Future<Either<Failure, User>> validateCode(
      {String verificationId, String code});

  Future<Either<Failure, User>> currentUser();

  Future<void> logout();
}
