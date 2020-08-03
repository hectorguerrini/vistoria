import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
          Container(
            child: Card(
                child: ListTile(
              onTap: () {
                Modular.to.pushNamed('/cadastro/cliente');
              },
              contentPadding: EdgeInsets.all(8.0),
              title: Text(
                "Cadastro de Cliente",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              subtitle: Icon(
                Icons.person,
                color: Colors.black54,
                size: 72,
              ),
            )),
          ),
          Container(
            child: Card(
                child: ListTile(
              onTap: () {
                Modular.to.pushNamed('/cadastro/imovel');
              },
              contentPadding: EdgeInsets.all(8.0),
              title: Text(
                "Cadastro de Imovel",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              subtitle: Icon(
                Icons.home,
                color: Colors.black54,
                size: 72,
              ),
            )),
          ),
          Container(
            child: Card(
                child: ListTile(
              onTap: () {
                Modular.to
                    .pushNamed('/cadastro/lista_clientes', arguments: false);
              },
              contentPadding: EdgeInsets.all(8.0),
              title: Text(
                "Clientes Cadastrados",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              subtitle: Icon(
                Icons.group,
                color: Colors.black54,
                size: 72,
              ),
            )),
          ),
          Container(
            child: Card(
                child: ListTile(
              onTap: () {
                Modular.to
                    .pushNamed('/cadastro/lista_imoveis', arguments: false);
              },
              contentPadding: EdgeInsets.all(8.0),
              title: Text(
                "Imoveis Cadastrados",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              subtitle: Icon(
                Icons.list,
                color: Colors.black54,
                size: 72,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
