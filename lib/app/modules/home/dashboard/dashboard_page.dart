import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:vistoria/app/modules/home/dashboard/components/card_dashboard_widget.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: [
        Observer(builder: (_) {
          if (controller.numberClientes.data == null) {
            return Center(child: CircularProgressIndicator());
          }
          return CardDashboardWidget(
              iconData: Icons.person,
              descricao: 'Clientes Cadastrados',
              metrica: controller.numberClientes.data);
        }),
        Observer(builder: (_) {
          if (controller.numberImoveis.data == null) {
            return Center(child: CircularProgressIndicator());
          }
          return CardDashboardWidget(
              iconData: FontAwesome5.home,
              descricao: 'Imoveis Cadastrados',
              metrica: controller.numberImoveis.data);
        }),
      ],
    );
  }
}
