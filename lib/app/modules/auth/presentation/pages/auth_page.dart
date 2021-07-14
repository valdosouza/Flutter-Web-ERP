import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:frontend/app/modules/auth/presentation/auth_cubit/auth_cubit.dart';

class AuthPage extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocProvider(
          create: (context) => Modular.get<AuthCubit>(),
          child: buildForm(),
        ),
      ),
    );
  }

  Widget buildForm() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }

        if (state is AuthSuccessState) {
          Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
        }
      },
      builder: (context, state) {
        print(state);
        return Column(
          children: <Widget>[
            if (state is AuthLoadingState) const CircularProgressIndicator(),
            TextFormField(
              controller: loginController,
              decoration: const InputDecoration(labelText: 'Login'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'password'),
            ),
          ],
        );
      },
    );
  }
}
