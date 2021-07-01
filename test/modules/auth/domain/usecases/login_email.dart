import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/modules/auth/domain/entities/user.dart';
import 'package:frontend/app/modules/auth/domain/usescases/login_email.dart';
import 'package:mockito/mockito.dart';

import 'package:frontend/app/modules/auth/domain/repositories/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  const tlogin = 'valdo@setes.com.br';
  const tpassword = 'Scopeae2021';

  MockAuthRepository mockAuthRepository = MockAuthRepository();
  LoginEmail usecase = LoginEmail(mockAuthRepository);

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = LoginEmail(mockAuthRepository);
  });

  const tresult = User(
    id: 1,
    login: tlogin,
    password: tpassword,
  );
  test(
    'Should login using own Node api',
    () async {
      //Arrange
      when(mockAuthRepository.loginEmail(login: tlogin, password: tpassword))
          .thenAnswer((_) async => const Right(tresult));
      //act
      final result = await usecase(
          const Params(id: 0, login: tlogin, password: tpassword));
      //assert
    },
  );
}
