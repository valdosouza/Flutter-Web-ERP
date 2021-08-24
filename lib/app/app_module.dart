import 'package:erpgestao/app/modules/auth/auth_module.dart';
import 'package:erpgestao/app/modules/drawer/drawer_module.dart';
import 'package:erpgestao/app/modules/drawer/presentation/cubit/drawer_cubit.dart';
import 'package:erpgestao/app/modules/home/home_module.dart';
import 'package:erpgestao/app/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteValidate implements RouteGuard {
  @override
  Future<bool> canActivate(String url, ModularRoute route) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String token = sp.getString('token').toString();
    if (token.compareTo("") != 0) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  String? get guardedRoute => throw UnimplementedError();
}

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => DrawerCubit()),
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/drawer', module: DrawerModule()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
