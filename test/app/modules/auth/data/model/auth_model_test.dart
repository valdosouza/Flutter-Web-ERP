import 'dart:convert';

import 'package:erpgestao/app/modules/auth/data/model/auth_model.dart';
import 'package:erpgestao/app/modules/auth/domain/entities/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  const tAuthModel = AuthModel(
      auth: true,
      id: 1,
      institution: 2,
      username: 'valdo@setes.com.br',
      password: '827CCB0EEA8A706C4C34A16891F84E7B',
      jwt: "StringJWT");
  test('Should be a subclass of AuthEntity', () async {
    // assert
    expect(tAuthModel, isA<AuthEntity>());
  });

  test(
    'should return a valid model the JSON Auth',
    () async {
      // arrange
      final String jsonString = fixture('auth.json');
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      // act

      final result = AuthModel.fromJson(jsonMap);
      // assert
      expect(result, tAuthModel);
    },
  );
}
