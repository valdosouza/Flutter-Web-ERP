import 'package:flutter/material.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de Gestão - ERP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale.fromSubtags(languageCode: 'br')
      ],
    ).modular();
  }
}
