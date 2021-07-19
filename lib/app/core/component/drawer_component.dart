import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
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
          itemMenuDraw(Icons.home_repair_service_rounded, 'Sistema',
              () => {Navigator.pushNamed(context, '')}),
          itemMenuDraw(Icons.exposure_rounded, 'Vendas',
              () => {Navigator.pushNamed(context, '')}),
          itemMenuDraw(Icons.supervised_user_circle_rounded, 'Compras',
              () => {Navigator.pushNamed(context, '')}),
          itemMenuDraw(
              Icons.star, 'Estoque', () => {Navigator.pushNamed(context, '')}),
          itemMenuDraw(
              Icons.refresh, 'Caixa', () => {Navigator.pushNamed(context, '')}),
          itemMenuDraw(Icons.settings, 'Bancário',
              () => {Navigator.pushNamed(context, '')}),
          itemMenuDraw(
              Icons.close, 'Sair', () => {Navigator.pushNamed(context, '')}),
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
