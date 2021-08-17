import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/data/datasource/remote/ownapi/auth_datasource.dart';
import 'package:frontend/app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:frontend/app/modules/auth/domain/usescases/login_email.dart';
import 'package:frontend/app/modules/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:frontend/app/modules/auth/presentation/pages/auth_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AuthDatasourceImpl()),
        Bind.singleton(
            (i) => AuthRepositoryImpl(datasource: i.get<AuthDatasourceImpl>())),
        Bind((i) => LoginEmail(repository: i.get<AuthRepositoryImpl>())),
        Bind.singleton((i) => AuthCubit(i())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
  ];
}
