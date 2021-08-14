import 'package:bloc/bloc.dart';
import 'package:frontend/app/modules/drawer/presentation/cubit/drawer_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(const DrawerState.initial());

  Future<void> logOut() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final bool result = sp.getString('token') != '';
    if (result) {
      await sp.setString('token', '');
      emit(DrawerState.logout(logout: result));
    }
  }
}
