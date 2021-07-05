import 'package:frontend/app/modules/auth/data/model/auth_model.dart';

abstract class AuthDatasource {
  Future<AuthModel> getAuthentication(
      {required String username, required String password});
}
