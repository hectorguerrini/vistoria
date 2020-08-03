import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vistoria/app/modules/vistoria/itens-ambiente/itens_ambiente_controller.dart';
import 'package:vistoria/app/modules/vistoria/models/itens_ambiente_model.dart';
import 'package:vistoria/app/enumeration/itens_ambiente_enum.dart';
import 'package:vistoria/app/enumeration/estado_itens_enum.dart';

class ItensAmbientePage extends StatefulWidget {
  final String title;

  const ItensAmbientePage({Key key, this.title = 'Cadastro itens do ambiente'})
      : super(key: key);
  @override
  _ItensAmbientePageState createState() => _ItensAmbientePageState();
}

class _ItensAmbientePageState
    extends ModularState<ItensAmbientePage, ItensAmbienteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Card(
              child: FlatButton.icon(
                  onPressed: controller.addItem,
                  icon: Icon(Icons.add),
                  label: Text('Adicionar Item')),
            ),
            Divider(),
            Observer(builder: (_) {
              if (controller.getListItens.length == 0) {
                return Center(
                    child: Text(
                  "Nenhum item",
                  style: TextStyle(color: Colors.black54),
                ));
              }
              List<ItensAmbienteModel> list = controller.getListItens;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.getListItens.length,
                  itemBuilder: (context, index) {
                    ItensAmbienteModel item = list[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration:
                                  BoxDecoration(color: Colors.grey[400]),
                              child: Icon(Icons.camera_alt),
                            ),
                            ListTile(
                              title: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text:
                                        "Item: ${item.item.toShortString()}\n"),
                                TextSpan(
                                    text:
                                        "Estado: ${item.estadoItens.toShortString()}"),
                              ])),
                              subtitle: Text(item.observacao),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            })
          ],
        ),
      ),
    );
  }
}
