import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/presentation/pages/auth_page.dart';

class AuthModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
  ];
}
