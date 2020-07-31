import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'vistoria_controller.dart';

class VistoriaPage extends StatefulWidget {
  final String title;
  const VistoriaPage({Key key, this.title = "Vistoria"}) : super(key: key);

  @override
  _VistoriaPageState createState() => _VistoriaPageState();
}

class _VistoriaPageState
    extends ModularState<VistoriaPage, VistoriaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Container(
            child: Card(
                child: ListTile(
              onTap: () {
                Modular.to.pushNamed('/vistoria/nova_vistoria');
              },
              contentPadding: EdgeInsets.all(8.0),
              title: Text(
                "Realizar Vistoria",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              subtitle: Icon(
                FontAwesome5.wpforms,
                color: Colors.black54,
                size: 72,
              ),
            )),
          )
        ],
      ),
    );
  }
}
