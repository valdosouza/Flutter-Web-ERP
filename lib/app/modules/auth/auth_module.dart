import 'package:frontend/app/modules/auth/presentation/cubit/auth_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/presentation/pages/auth_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AuthPage()),
  ];
}
