import 'package:erpgestao/app/modules/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required bool auth,
    required int id,
    required int institution,
    required String username,
    required String password,
    required String jwt,
  }) : super(
          auth: auth,
          id: id,
          institution: institution,
          username: username,
          password: password,
          jwt: jwt,
        );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      auth: json['auth'] as bool,
      id: int.parse(json['id'].toString()),
      institution: int.parse(json['institution'].toString()),
      username: json['username'] as String,
      password: json['password'] as String,
      jwt: json['jwt'] as String,
    );
  }
}
