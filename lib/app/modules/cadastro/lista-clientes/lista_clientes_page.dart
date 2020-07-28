import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:vistoria/app/modules/cadastro/lista-clientes/lista_clientes_controller.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/shared/components/confirmation_dialog.dart';

class ListaClientesPage extends StatefulWidget {
  final String title;
  final bool modoSelecao;
  const ListaClientesPage(
      {Key key, this.title = 'Lista de Clientes', this.modoSelecao = false})
      : super(key: key);

  @override
  _ListaClientesPageState createState() => _ListaClientesPageState();
}

class _ListaClientesPageState
    extends ModularState<ListaClientesPage, ListaClientesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.modoSelecao ? 'Selecionar Cliente' : widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: 'Buscar',
                    hintText: 'Buscar por nome, cpf.',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
              Observer(builder: (_) {
                if (controller.listClientes.error != null) {
                  return Center(
                      child: RaisedButton(
                          onPressed: controller.getListaClientes,
                          child: Text('Carregar')));
                }
                if (controller.listClientes.value == null) {
                  return Center(child: CircularProgressIndicator());
                }

                List<ClienteModel> list = controller.listClientes.value;

                return ListView.separated(
                  padding: EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ClienteModel item = list[index];
                    return ListTile(
                      onTap: () async {
                        if (widget.modoSelecao) {
                          var confimacao = await Modular.to.showDialog(
                              builder: (context) => ConfirmationDialog());
                          if (confimacao) {
                            Modular.to.pop(item);
                          }
                        }
                      },
                      title: Text(item.nomeCompleto),
                      subtitle: Text(
                          "${item.cpf}\nCel:${item.celular}\n${item.telefone != null ? "Tel:" + item.telefone : ""}"),
                      trailing: item.isWhatsapp
                          ? Icon(
                              FontAwesome.whatsapp,
                              color: Colors.green,
                            )
                          : Icon(Icons.phone),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    thickness: 1.0,
                  ),
                  itemCount: list.length,
                );
              }),
            ],
          ),
        ));
  }
}
