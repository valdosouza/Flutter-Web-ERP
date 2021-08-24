import 'package:dartz/dartz.dart';
import 'package:erpgestao/app/core/error/failures.dart';
import 'package:erpgestao/app/modules/auth/data/model/auth_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> loginEmail({
    required String username,
    required String password,
  });
}
