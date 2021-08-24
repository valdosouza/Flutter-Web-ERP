import 'package:erpgestao/app/modules/auth/presentation/pages/auth_page.dart';
import 'package:erpgestao/app/modules/drawer/presentation/cubit/drawer_cubit.dart';
import 'package:erpgestao/app/modules/drawer/presentation/drawer_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => DrawerCubit(),
        ),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DrawerPage()),
    ChildRoute('/Auth', child: (_, args) => AuthPage()),
  ];
}
