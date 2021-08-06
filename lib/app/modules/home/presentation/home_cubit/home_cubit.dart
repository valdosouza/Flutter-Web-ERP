import 'package:bloc/bloc.dart';
import 'package:frontend/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:frontend/app/modules/home/data/repositories/home_repository_impl.dart';
import 'package:frontend/app/modules/home/presentation/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepositoryImpl _repository;

  HomeCubit(this._repository) : super(HomeInitial());

  Future<void> getFinancialClosed(String initialDate, String finalDate) async {
    try {
      emit(HomeLoadingState());

      final homeSalesPaymentTypesModel = await _repository.getFinancialClosed(
          initialDate: initialDate, finalDate: finalDate);

      emit(HomeLoadedState(
          homeSalesPaymentTypesModel as List<HomeSalesPaymentTypeModel>));
    } catch (e) {
      print(e);
      emit(
          const HomeErrorState('Erro ao Listar Vendas por Forma de Pagamento'));
    }
  }
}
