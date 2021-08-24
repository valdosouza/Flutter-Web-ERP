import 'package:bloc/bloc.dart';
import 'package:erpgestao/app/modules/splash/presentation/cubit/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  Future<void> checkLogged() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String token = sp.getString('token').toString();
    final bool result = token.compareTo("") != 0;
    emit(SplashState.logged(logged: result));
  }
}
