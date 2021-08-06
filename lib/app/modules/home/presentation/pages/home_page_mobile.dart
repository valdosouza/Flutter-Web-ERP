import 'package:flutter/material.dart';
import 'package:frontend/app/core/component/drawer_component.dart';
import 'package:frontend/app/modules/home/presentation/content/content_mobile.dart';

class HomePageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplicativo ERP"),
      ),
      drawer: DrawerComponent(),
      body: ContentMobile(),
    );
  }
}
