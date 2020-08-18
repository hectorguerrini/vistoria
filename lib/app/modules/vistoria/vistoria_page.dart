import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:vistoria/app/shared/components/card_menu_widget.dart';
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
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          CardMenuWidget(
            title: 'Cadastro de Vistoria',
            icon: FontAwesome5.wpforms,
            onTap: () {
              Modular.to.pushNamed('/vistoria/cadastro');
            },
          ),
          CardMenuWidget(
            title: 'Vistorias Cadastradas',
            icon: FontAwesome5.clipboard_list,
            onTap: () {
              Modular.to.pushNamed('/vistoria/lista');
            },
          ),
        ],
      ),
    );
  }
}
