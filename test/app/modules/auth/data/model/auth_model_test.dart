import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/modules/auth/data/model/auth_model.dart';
import 'package:frontend/app/modules/auth/domain/entities/auth_entity.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  const tAuthModel = AuthModel(
      id: 1,
      username: 'valdo@setes.com.br',
      password: '12345',
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
      //const String jsonString =
      //    '{"id": "1","username": "valdo@setes.com.br","password": "12345","jwt": "StringJWT"}';
      //const Map<String, AuthModel> jsonMap = json.decode(jsonString);
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      // act

      final result = AuthModel.fromJson(jsonMap);
      // assert
      expect(result, tAuthModel);
    },
  );
}
