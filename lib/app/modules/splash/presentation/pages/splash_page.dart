import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/splash/presentation/cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    final pageCubit = Modular.get<SplashCubit>();
    pageCubit.checkLogged();
    pageCubit.stream.listen((state) {
      if (!state.logged) {
        Modular.to.popAndPushNamed('/auth');
      } else {
        Modular.to.popAndPushNamed('/home');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            Image.asset(
              "images/logo_setes.png",
              width: 450,
              height: 140,
              fit: BoxFit.fill,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
