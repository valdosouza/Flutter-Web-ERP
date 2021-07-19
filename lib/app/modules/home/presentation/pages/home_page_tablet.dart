import 'package:flutter/material.dart';
import 'package:frontend/app/core/component/drawer_component.dart';
import 'package:frontend/app/modules/home/presentation/component/content_tablet.dart';
import 'package:frontend/app/modules/home/presentation/component/items_menus.dart';

class HomePageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplicativo ERP"),
      ),
      drawer: DrawerComponent(),
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ItemsMenus(),
            ),
            Expanded(
              flex: 2,
              child: ContentTablet(),
            ),
          ],
        ),
      ),
    );
  }
}
