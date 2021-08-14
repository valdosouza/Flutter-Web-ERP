import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/splash/presentation/cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    final splashCubit = Modular.get<SplashCubit>();
    splashCubit.checkLogged();

    splashCubit.stream.listen((state) {
      if (state.logged) {
        print("logado");
        Modular.to.popAndPushNamed('/home');
      } else {
        print("Não logado");
        Modular.to.popAndPushNamed('/auth');
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
