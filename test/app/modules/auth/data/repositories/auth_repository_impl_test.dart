import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/core/plataform/network_info.dart';
import 'package:frontend/app/modules/auth/data/datasource/remote/ownapi/auth_datasource.dart';
import 'package:frontend/app/modules/auth/data/model/auth_model.dart';
import 'package:frontend/app/modules/auth/data/repositories/auth_repository_impl.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRepositoryImpl]) //new
@GenerateMocks([AuthDatasource]) //new
@GenerateMocks([NetworkInfo]) //new
void main() {
  late AuthRepositoryImpl repository;
  late MockAuthDatasource mockAuthDatasource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockAuthDatasource = MockAuthDatasource();
    mockNetworkInfo = MockNetworkInfo();

    repository = AuthRepositoryImpl(
      datasource: mockAuthDatasource,
      networkinfo: mockNetworkInfo,
    );
  });

  const tAuthModel = AuthModel(
    id: 0,
    username: 'valdo@setes.com.br',
    password: '827CCB0EEA8A706C4C34A16891F84E7B',
    jwt: '',
  );
  test(
    'should return AuthModel com jwt',
    () async {
      // arrange
      when(mockAuthDatasource.getAuthentication(
              username: tAuthModel.username, password: tAuthModel.password))
          .thenAnswer((_) async => tAuthModel);
      // act
      final result = await repository.loginEmail(
          username: tAuthModel.username, password: tAuthModel.password);
      // assert
      verify(mockAuthDatasource.getAuthentication(
          username: tAuthModel.username, password: tAuthModel.password));
      expect(result, const Right(tAuthModel));
    },
  );
}
