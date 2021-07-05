import 'package:frontend/app/modules/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required int id,
    required String username,
    required String password,
    required String jwt,
  }) : super(
          id: id,
          username: username,
          password: password,
          jwt: jwt,
        );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: int.parse(json['id'] as String),
      username: json['username'] as String,
      password: json['password'] as String,
      jwt: json['jwt'] as String,
    );
  }
}
