import 'package:frontend/app/modules/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel.mapper(Map<String, dynamic> data)
      : super(
          username: data[1] as String,
          password: data[2] as String,
          jwt: data[3] as String,
        );
}
