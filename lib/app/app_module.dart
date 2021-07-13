import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/splash/presentation/pages/spash_page.dart';
import 'package:frontend/app/modules/auth/auth_module.dart';
import 'package:frontend/app/modules/home/home_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> bind = [];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => SplashPage()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
