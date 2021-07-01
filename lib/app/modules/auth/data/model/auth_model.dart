import 'package:frontend/app/modules/auth/domain/entities/user.dart';

class AuthModel extends User {
  AuthModel.mapper(Map<int, dynamic> data)
      : super(
          id: data[0] as int,
          login: data[1] as String,
          password: data[2] as String,
        );
}
