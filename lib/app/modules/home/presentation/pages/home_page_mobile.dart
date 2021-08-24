import 'package:erpgestao/app/modules/drawer/presentation/drawer_page.dart';
import 'package:erpgestao/app/modules/home/presentation/content/content_mobile.dart';
import 'package:flutter/material.dart';

class HomePageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplicativo ERP"),
      ),
      drawer: DrawerPage(),
      body: ContentMobile(),
    );
  }
}
