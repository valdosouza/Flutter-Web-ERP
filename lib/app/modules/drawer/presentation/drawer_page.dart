import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/drawer/presentation/cubit/drawer_cubit.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: <Color>[
                Colors.blue,
                Colors.blueGrey,
              ],
            )),
            child: Container(
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    elevation: 10,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "images/logo_setes.png",
                          width: 225,
                          height: 70,
                          //fit: BoxFit.fill,
                        )),
                  ),
                  const Text(
                    'Nome do Usuario',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ),
          ),
          itemMenuDraw(
              Icons.home, 'Dashbord', () => {Navigator.pushNamed(context, '')}),
          itemLogout(Icons.close, 'Sair'),
        ],
      ),
    );
  }

  // ignore: must_be_immutable
  Widget itemMenuDraw(IconData icon, String text, Function ontap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            onTap: () => ontap,
            splashColor: Colors.orangeAccent,
            child: Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: 16.0),
                      ))
                ],
              ),
            )),
      ),
    );
  }

  Widget itemLogout(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            onTap: () async {
              print("Saindo - Logout");
              final _drawerCubit = Modular.get<DrawerCubit>();
              await _drawerCubit.logOut();
              await Modular.to.popAndPushNamed('/auth/');
            },
            splashColor: Colors.orangeAccent,
            child: Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: 16.0),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
