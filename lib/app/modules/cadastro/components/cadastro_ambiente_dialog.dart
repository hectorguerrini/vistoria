import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:vistoria/app/modules/cadastro/cadastro-imovel/cadastro_imovel_controller.dart';

class CadastroAmbienteDialog extends StatefulWidget {
  final String title;
  final bool modoEdicao;
  const CadastroAmbienteDialog(
      {Key key, this.title = 'Cadastrar Ambiente', this.modoEdicao = false})
      : super(key: key);
  @override
  _CadastroAmbienteDialogState createState() => _CadastroAmbienteDialogState();
}

class _CadastroAmbienteDialogState extends State<CadastroAmbienteDialog> {
  final CadastroImovelController controller =
      Modular.get<CadastroImovelController>();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(title: Text(widget.title), children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Observer(builder: (_) {
          return DropdownButton(
              disabledHint:
                  Text(controller.getStringAmbiente),
              isExpanded: true,
              hint: Text('Ambientes'),
              value: controller.getAmbiente,
              items: controller.listAmbientes
                  .map((e) => DropdownMenuItem(
                      child: Text(e.toString().split('.')[1]), value: e))
                  .toList(),
              onChanged: !widget.modoEdicao ? controller.setAmbiente : null);
        }),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          onChanged: controller.setQtde,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Quantidade'),
        ),
      ),
      ButtonBar(
        children: <Widget>[
          FlatButton.icon(
              onPressed: () => Modular.to.pop(),
              icon: Icon(
                FontAwesome.cancel,
                color: Colors.red,
              ),
              label: Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              )),
          Observer(builder: (_) {
            return FlatButton.icon(
                onPressed: controller.isFieldsValid
                    ? () {
                        controller.addAmbiente();
                        Modular.to.pop();
                      }
                    : null,
                icon: Icon(FontAwesome.floppy),
                label: Text('Adicionar'));
          }),
        ],
      )
    ]);
  }
}
