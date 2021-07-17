import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/modules/auth/data/model/auth_model.dart';
import 'package:frontend/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:frontend/app/modules/auth/domain/usescases/login_email_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'login_email_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late LoginEmailUseCase usecase;
  late MockAuthRepository mockAuthRepository;

  late Params tParams;
  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = LoginEmailUseCase(repository: mockAuthRepository);
  });
  const tAuthModel = AuthModel(
    auth: true,
    id: 0,
    username: 'testEmail@Email',
    password: '123',
    jwt: 'StringJWT',
  );
  tParams = Params(
    AuthModel(
      auth: true,
      id: 0,
      username: tAuthModel.username,
      password: tAuthModel.password,
      jwt: '',
    ),
  );
  test(
    'should get JWT auth  API',
    () async {
      // arrange
      when(mockAuthRepository.loginEmail(
              username: tAuthModel.username, password: tAuthModel.password))
          .thenAnswer((_) async => const Right(tAuthModel));
      // act
      final result = await usecase(tParams);
      // assert
      expect(result, const Right(tAuthModel));
      verify(mockAuthRepository.loginEmail(
          username: tAuthModel.username, password: tAuthModel.password));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
