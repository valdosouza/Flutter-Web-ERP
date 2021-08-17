import 'package:bloc/bloc.dart';
import 'package:frontend/app/core/cubit/base_page_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasePageCubit extends Cubit<BasePageState> {
  BasePageCubit() : super(const BasePageState.initial());

  Future<void> checkLogged() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String token = sp.getString('token').toString();
    final bool result = token.compareTo("") != 0;
    emit(BasePageState.logged(logged: result));
  }
}
