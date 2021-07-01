import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de Gestão - ERP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
    ).modular();
  }
}
