import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/modules/auth/domain/entities/auth_entity.dart';
import 'package:frontend/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:frontend/app/modules/auth/domain/usescases/login_email_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_email_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository]) //new
void main() {
  late LoginEmailUseCase usecase;
  late MockAuthRepository mockAuthRepository;

  late AuthEntity tAuthEntity;
  late Params tParams;
  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = LoginEmailUseCase(repository: mockAuthRepository);
    tAuthEntity = const AuthEntity(
      username: 'testEmail@Email',
      password: '123',
      jwt: 'StringJWT',
    );

    tParams =
        Params(username: tAuthEntity.username, password: tAuthEntity.password);
  });

  test(
    'should get JWT authenticarion from nodeJs API',
    () async {
      // arrange
      when(mockAuthRepository.loginEmail(
              username: tAuthEntity.username, password: tAuthEntity.password))
          .thenAnswer((_) async => Right(tAuthEntity));
      // act
      final result = await usecase(tParams);
      // assert
      expect(result, equals(Right(tAuthEntity)));
      verify(mockAuthRepository.loginEmail(
          username: tAuthEntity.username, password: tAuthEntity.password));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
