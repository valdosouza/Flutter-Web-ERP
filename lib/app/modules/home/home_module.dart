import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/home/data/remote/ownapi/home_datasource.dart';
import 'package:frontend/app/modules/home/data/repositories/home_repository_impl.dart';
import 'package:frontend/app/modules/home/domain/usescases/get_financial_closed_usecase.dart';
import 'package:frontend/app/modules/home/presentation/home_cubit/home_cubit.dart';
import 'package:frontend/app/modules/home/presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeDatasourceImpl()),
        Bind.factory(
            (i) => HomeRepositoryImpl(datasource: i.get<HomeDatasourceImpl>())),
        Bind((i) =>
            GetFinancialClosedUseCase(repository: i.get<HomeRepositoryImpl>())),
        Bind.factory((i) => HomeCubit(i())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
