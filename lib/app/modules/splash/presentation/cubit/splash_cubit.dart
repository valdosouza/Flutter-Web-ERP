import 'package:bloc/bloc.dart';
import 'package:frontend/app/modules/splash/presentation/cubit/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  Future<void> checkLogged() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final bool result = sp.containsKey('token');
    emit(SplashState.logged(logged: result));
  }
}