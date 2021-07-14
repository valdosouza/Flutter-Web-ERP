import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/splash/presentation/pages/splash_page.dart';

class SplashModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
  ];
}
