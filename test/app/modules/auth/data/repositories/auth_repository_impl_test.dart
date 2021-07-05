import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/modules/auth/data/datasource/remote/ownapi/auth_datasource.dart';
import 'package:frontend/app/modules/auth/data/model/auth_model.dart';
import 'package:frontend/app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthDatasource]) //new
void main() {
  late AuthRepositoryImpl repository;
  late MockAuthDatasource datasource;

  setUp(() {
    datasource = MockAuthDatasource();
    repository = AuthRepositoryImpl(datasource);
  });

  const tAuthModel = AuthModel(
      id: 1, username: 'valdo@setes.com.br', password: '12345', jwt: 'token');
  test('Should return Hash number JWT.', () async {
    // arrange
    when(datasource.getAuthentication(
            username: tAuthModel.username, password: tAuthModel.password))
        .thenAnswer((_) async => tAuthModel);
    // act
    final result = await repository.loginEmail(
        username: tAuthModel.username, password: tAuthModel.password);
    // assert
    expect(result, const Right(tAuthModel));
    verify(datasource);
  });
}
