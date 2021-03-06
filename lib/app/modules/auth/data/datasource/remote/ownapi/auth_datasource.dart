import 'dart:convert';
import 'package:erpgestao/app/core/error/exceptions.dart';
import 'package:erpgestao/app/core/shared/constants.dart';
import 'package:erpgestao/app/modules/auth/data/model/auth_model.dart';
import 'package:http/http.dart' as http;

/// Calls the https://www.api.gestaosetes.com.br/users/authenticate/ endpoint.
///
/// Throws a [ServerException] for all error codes.
abstract class AuthDatasource {
  Future<AuthModel> getAuthentication(
      {required String username, required String password});
}

class AuthDatasourceImpl implements AuthDatasource {
  final _baseUrl = '${Constants.baseApiUrl}/users/authenticate/';
  final client = http.Client();
  @override
  Future<AuthModel> getAuthentication(
      {required String username, required String password}) async {
    final response = await client.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'email': "${username}",
          'password': "${password.toUpperCase()}",
        },
      ),
    );
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body) as Map<String, dynamic>;

      return AuthModel.fromJson(jsonMap);
    } else {
      throw ServerException();
    }
  }
}
