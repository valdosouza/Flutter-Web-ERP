import 'package:erpgestao/app/modules/splash/presentation/cubit/splash_cubit.dart';
import 'package:erpgestao/app/modules/splash/presentation/pages/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashCubit()),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
  ];
}
