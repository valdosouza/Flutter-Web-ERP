import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/splash/presentation/cubit/splash_cubit.dart';
import 'package:frontend/app/modules/splash/presentation/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => SplashCubit(),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
  ];
}
