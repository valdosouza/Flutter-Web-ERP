import 'package:erpgestao/app/modules/home/data/remote/ownapi/home_datasource.dart';
import 'package:erpgestao/app/modules/home/data/repositories/home_repository_impl.dart';
import 'package:erpgestao/app/modules/home/domain/usescases/get_financial_closed_usecase.dart';
import 'package:erpgestao/app/modules/home/presentation/home_cubit/home_cubit.dart';
import 'package:erpgestao/app/modules/home/presentation/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeDatasourceImpl()),
        Bind.singleton(
            (i) => HomeRepositoryImpl(datasource: i.get<HomeDatasourceImpl>())),
        Bind((i) =>
            GetFinancialClosedUseCase(repository: i.get<HomeRepositoryImpl>())),
        Bind.singleton((i) => HomeCubit(
            getFinancialClosedUseCase: i.get<GetFinancialClosedUseCase>())),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
