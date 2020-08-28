import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'package:vistoria/app/shared/components/card_menu_widget.dart';
import 'cadastro_controller.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
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
          CardMenuWidget(
            title: 'Cadastro de Cliente',
            icon: Icons.person,
            onTap: () {
              Modular.to.pushNamed('/cadastro/cliente');
            },
          ),
          CardMenuWidget(
            title: 'Cadastro de Imóvel',
            icon: FontAwesome5.house_user,
            onTap: () {
              Modular.to.pushNamed('/cadastro/imovel');
            },
          ),
          CardMenuWidget(
            title: 'Clientes Cadastrados',
            icon: FontAwesome5.users,
            onTap: () {
              Modular.to
                  .pushNamed('/cadastro/lista_clientes', arguments: false);
            },
          ),
          CardMenuWidget(
            title: 'Imoveis Cadastrados',
            icon: FontAwesome5.home,
            onTap: () {
              Modular.to.pushNamed('/cadastro/lista_imoveis', arguments: false);
            },
          ),
        ],
      ),
    );
  }
}
