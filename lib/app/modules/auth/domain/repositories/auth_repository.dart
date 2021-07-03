import 'package:dartz/dartz.dart';
import 'package:frontend/app/core/error/failures.dart';
import 'package:frontend/app/modules/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> loginEmail({
    required String username,
    required String password,
  });
}
