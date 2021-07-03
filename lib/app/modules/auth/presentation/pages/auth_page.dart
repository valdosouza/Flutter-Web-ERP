import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/modules/auth/presentation/cubit/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  // ignore: close_sinks
  final AuthBloc bloc = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[],
      ),
    );
  }
}
