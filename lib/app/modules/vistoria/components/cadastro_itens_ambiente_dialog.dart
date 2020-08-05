import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:vistoria/app/enumeration/estado_itens_enum.dart';
import 'package:vistoria/app/enumeration/itens_ambiente_enum.dart';
import 'package:vistoria/app/modules/vistoria/itens-ambiente/itens_ambiente_controller.dart';

class CadastroItensAmbienteDialog extends StatefulWidget {
  final String title;
  final bool modoEdicao;
  const CadastroItensAmbienteDialog(
      {Key key,
      this.title = 'Cadastrar Item do Ambiente',
      this.modoEdicao = false})
      : super(key: key);
  @override
  _CadastroItensAmbienteDialogState createState() =>
      _CadastroItensAmbienteDialogState();
}

class _CadastroItensAmbienteDialogState
    extends State<CadastroItensAmbienteDialog> {
  final ItensAmbienteController controller =
      Modular.get<ItensAmbienteController>();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(15),
      title: Text(widget.title),
      children: <Widget>[
        Observer(builder: (_) {
          return DropdownButton(
              isExpanded: true,
              underline: Container(height: 0),
              hint: Text('Item do ambiente'),
              value: controller.getItemAmbiente,
              items: ItensAmbiente.values
                  .map((e) => DropdownMenuItem(
                      child: Text(e.toShortString()), value: e))
                  .toList(),
              onChanged: controller.setItemAmbiente);
        }),
        Observer(builder: (_) {
          return DropdownButton(
              isExpanded: true,
              underline: Container(height: 0),
              hint: Text('Estado de conservação'),
              value: controller.getEstado,
              items: EstadoItens.values
                  .map((e) => DropdownMenuItem(
                      child: Text(e.toShortString()), value: e))
                  .toList(),
              onChanged: controller.setEstado);
        }),
        TextFormField(
          onChanged: controller.setObservacoes,
          textCapitalization: TextCapitalization.sentences,
          maxLines: null,
          decoration: InputDecoration(labelText: 'Observações'),
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
              if (widget.modoEdicao) {
                return FlatButton.icon(
                    onPressed: controller.isFieldsValid
                        ? () {
                            Modular.to.pop(controller.itens);
                          }
                        : null,
                    icon: Icon(FontAwesome.floppy),
                    label: Text('Editar'));
              }

              return FlatButton.icon(
                  onPressed: controller.isFieldsValid
                      ? () {
                          Modular.to.pop(controller.itens);
                        }
                      : null,
                  icon: Icon(FontAwesome.floppy),
                  label: Text('Adicionar'));
            }),
          ],
        )
      ],
    );
  }
}
