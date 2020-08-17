import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:vistoria/app/modules/vistoria/itens-ambiente/itens_ambiente_controller.dart';
import 'package:vistoria/app/modules/vistoria/models/itens_ambiente_model.dart';
import 'package:vistoria/app/enumeration/itens_ambiente_enum.dart';
import 'package:vistoria/app/enumeration/estado_itens_enum.dart';
import 'package:vistoria/app/shared/components/custom_floating_button_save.dart';

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
    return WillPopScope(
      onWillPop: controller.willPop,
      child: Scaffold(
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
                if (controller.listItens.length == 0) {
                  return Center(
                      child: Text(
                    "Nenhum item",
                    style: TextStyle(color: Colors.black54),
                  ));
                }
                List<ItensAmbienteModel> list = controller.listItens.toList();
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        ItensAmbienteModel item = list[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () =>
                                      controller.abrirGaleria(item, index),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[400]),
                                      child: Observer(builder: (_) {
                                        if (controller.listItens[index].photoUrl
                                                    .length ==
                                                0 &&
                                            (controller.listItens[index]
                                                        .fileImages ==
                                                    null ||
                                                controller.listItens[index]
                                                        .fileImages?.length ==
                                                    0)) {
                                          return Center(
                                            child: Icon(Icons.camera),
                                          );
                                        }

                                        return ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: <Widget>[
                                              ...List.generate(
                                                  item.photoUrl.length,
                                                  (index) => Image.network(
                                                      item.photoUrl[index])),
                                              ...List.generate(
                                                  item.fileImages.length,
                                                  (index) => Image.file(
                                                      item.fileImages[index]))
                                            ]);
                                      })),
                                ),
                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text.rich(TextSpan(
                                        style: TextStyle(fontSize: 14),
                                        children: [
                                          TextSpan(
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                              text:
                                                  "${index + 1}. ${item.item.toShortString()}\n"),
                                          TextSpan(
                                              text:
                                                  "- Estado ${item.estadoItens.toShortString()}"),
                                        ])),
                                  ),
                                  subtitle: Text('Obs: ' +
                                      (item.observacao != null
                                          ? item.observacao
                                          : '')),
                                ),
                                ButtonBar(
                                  children: <Widget>[
                                    FlatButton.icon(
                                        onPressed: () =>
                                            controller.photoItens(item, index),
                                        icon: Icon(FontAwesome.camera),
                                        label: Text('Adicionar Foto')),
                                    FlatButton.icon(
                                        onPressed: () => controller
                                            .editItemAmbiente(item, index),
                                        icon: Icon(FontAwesome.pencil),
                                        label: Text('Editar')),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              })
            ],
          ),
        ),
        floatingActionButton: CustomFloatingButtonSave(
          f: controller.save,
        ),
      ),
    );
  }
}
