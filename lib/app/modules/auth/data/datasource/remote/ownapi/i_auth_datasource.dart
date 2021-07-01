import 'package:frontend/app/modules/auth/data/model/auth_model.dart';

abstract class IAuthDataSource {
  Future<AuthModel> getUserLogin(String login, String password);
}
