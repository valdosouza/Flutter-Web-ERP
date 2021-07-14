import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/auth_module.dart';
import 'package:frontend/app/modules/home/home_module.dart';
import 'package:frontend/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
