import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
