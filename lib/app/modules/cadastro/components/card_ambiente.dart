import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:vistoria/app/enumeration/ambientes_enum.dart';
import 'package:vistoria/app/modules/cadastro/components/cadastro_ambiente_dialog.dart';
import 'package:vistoria/app/modules/cadastro/cadastro-imovel/cadastro_imovel_controller.dart';
import 'package:vistoria/app/modules/cadastro/models/ambiente_model.dart';
import 'package:vistoria/app/shared/components/confirmation_dialog.dart';

class CardAmbiente extends StatelessWidget {
  final CadastroImovelController _controller =
      Modular.get<CadastroImovelController>();
  final AmbienteModel item;

  CardAmbiente({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: AmbienteModel.getIcon(item.ambiente),
          title: Text(item.ambiente.toShortString()),
          subtitle: Text("Quantidade: ${item.quantidade}"),
          trailing: PopupMenuButton(
              icon: Icon(Icons.more_vert),
              offset: Offset(0, 100),
              onSelected: (value) async {
                switch (value) {
                  case 'EDITAR':
                    _controller.setAmbienteModel(item);
                    showDialog(
                        context: context,
                        builder: (_) => new CadastroAmbienteDialog(
                              modoEdicao: true,
                            ));
                    break;
                  case 'DELETAR':
                    var confimacao = await showDialog(
                        context: context,
                        builder: (_) => new ConfirmationDialog(
                              action: 'Deletar',
                            ));
                    if (confimacao) {
                      _controller.deleteAmbiente(item);
                    }
                    break;
                  default:
                }
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'EDITAR',
                      child: Row(children: <Widget>[
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(FontAwesome.pencil)),
                        Text('Editar')
                      ]),
                    ),
                    PopupMenuItem(
                      value: 'DELETAR',
                      textStyle: TextStyle(color: Colors.red),
                      child: Row(children: <Widget>[
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              FontAwesome.trash,
                              color: Colors.red,
                            )),
                        Text('Deletar')
                      ]),
                    ),
                  ])),
    );
  }
}
