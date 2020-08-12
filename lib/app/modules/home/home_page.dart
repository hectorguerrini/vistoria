import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Green Vistoria Imobiliaria"})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text(
      //           'App Vistoria Imob.',
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         decoration: BoxDecoration(color: Colors.green),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.person_add),
      //         title: Text('Cadastro'),
      //         onTap: () {
      //           Modular.to.pushNamed('/cadastro');
      //         },
      //       ),
      //       Divider(),
      //       ListTile(
      //         leading: Icon(Icons.note_add),
      //         title: Text('Vistoria'),
      //         onTap: () {
      //           Modular.to.pushNamed('/vistoria');
      //         },
      //       )
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            switch (value) {
              case 0:
                Modular.to.pushNamed('/cadastro');
                break;
              case 1:
                Modular.to.pushNamed('/vistoria');
                break;
              default:
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add), title: Text('Cadastros')),
            BottomNavigationBarItem(
                icon: Icon(Icons.note_add), title: Text('Vistorias')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('Configuração')),
          ]),
      body: Center(
        child: RaisedButton(
          onPressed: controller.resetButton,
          child: Text('Reset'),
        ),
      ),
    );
  }
}
