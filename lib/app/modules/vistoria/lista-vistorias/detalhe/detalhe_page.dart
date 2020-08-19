import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:vistoria/app/enumeration/ambientes_enum.dart';
import 'package:vistoria/app/enumeration/itens_ambiente_enum.dart';
import 'package:vistoria/app/enumeration/tipo_imovel_enum.dart';
import 'package:vistoria/app/modules/vistoria/lista-vistorias/detalhe/detalhe_controller.dart';

class DetalhePage extends StatefulWidget {
  final String title;

  const DetalhePage({Key key, this.title = "Detalhe"}) : super(key: key);
  @override
  _DetalhePageState createState() => _DetalhePageState();
}

class _DetalhePageState extends ModularState<DetalhePage, DetalheController> {
  getStyle({double size}) {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: size);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
              decoration: BoxDecoration(color: Colors.green),
              child: Column(
                children: [
                  Text(
                    controller.vistoriaModel.imovelModel.tipoImovel
                        .toShortString(),
                    style: getStyle(size: 24),
                  ),
                  Text(
                    controller.vistoriaModel.imovelModel.enderecoModel
                            .logradouro +
                        ' Nº' +
                        controller
                            .vistoriaModel.imovelModel.enderecoModel.numero,
                    style: getStyle(size: 14),
                  ),
                  Text(
                    controller.vistoriaModel.imovelModel.enderecoModel.cep,
                    style: getStyle(size: 14),
                  ),
                  Text(
                    controller.vistoriaModel.imovelModel.enderecoModel.bairro,
                    style: getStyle(size: 14),
                  ),
                  Text(
                    controller.vistoriaModel.imovelModel.enderecoModel.cidade +
                        '/' +
                        controller.vistoriaModel.imovelModel.enderecoModel.uf,
                    style: getStyle(size: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        alignment: Alignment.centerLeft,
                        child: Text('Proprietario',
                            style: TextStyle(
                              fontSize: 24,
                            )),
                      ),
                      ListTile(
                        title: Text(
                          controller.vistoriaModel.imovelModel.proprietario
                              .nomeCompleto,
                        ),
                        subtitle: Text.rich(TextSpan(
                            text: controller.vistoriaModel.imovelModel
                                    .proprietario.email +
                                '\n',
                            children: [
                              if (controller.vistoriaModel.imovelModel
                                  .proprietario.isWhatsapp)
                                WidgetSpan(
                                    child: Icon(
                                  FontAwesome5.whatsapp,
                                  size: 16,
                                  color: Colors.green,
                                )),
                              TextSpan(
                                  text: controller.vistoriaModel.imovelModel
                                      .proprietario.celular),
                              if (controller.vistoriaModel.imovelModel
                                      .proprietario.telefone !=
                                  null)
                                TextSpan(
                                    text: '/' +
                                        controller.vistoriaModel.imovelModel
                                            .proprietario.telefone),
                              TextSpan(text: '\n'),
                            ])),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16, top: 16),
                        alignment: Alignment.centerLeft,
                        child: Text('Locatario',
                            style: TextStyle(
                              fontSize: 24,
                            )),
                      ),
                      ListTile(
                        title: Text(
                          controller.vistoriaModel.locatario.nomeCompleto,
                        ),
                        subtitle: Text.rich(TextSpan(
                            text:
                                controller.vistoriaModel.locatario.email + '\n',
                            children: [
                              if (controller.vistoriaModel.locatario.isWhatsapp)
                                WidgetSpan(
                                    child: Icon(
                                  FontAwesome5.whatsapp,
                                  size: 16,
                                  color: Colors.green,
                                )),
                              TextSpan(
                                  text: controller
                                      .vistoriaModel.locatario.celular),
                              if (controller.vistoriaModel.locatario.telefone !=
                                  null)
                                TextSpan(
                                    text: '/' +
                                        controller
                                            .vistoriaModel.locatario.telefone),
                              TextSpan(text: '\n'),
                            ])),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ...controller.vistoriaModel.listAmbientes
                          .map((e) => Card(
                                child: Container(
                                  width: size.width,
                                  padding: EdgeInsets.only(
                                      top: 16, left: 16, right: 16),
                                  child: Column(
                                    children: [
                                      Text(
                                        e.ambiente.toShortString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        e.descricao,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      ...e.listItens
                                          .map((e) => Container(
                                              padding: EdgeInsets.only(top: 8),
                                              alignment: Alignment.centerLeft,
                                              child:
                                                  Text.rich(TextSpan(children: [
                                                WidgetSpan(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8),
                                                  child: Icon(
                                                    FontAwesome5.check,
                                                    size: 14,
                                                    color: Colors.green,
                                                  ),
                                                )),
                                                TextSpan(
                                                    text:
                                                        e.item.toShortString())
                                              ]))))
                                          .toList(),
                                      Container(
                                          padding: EdgeInsets.only(top: 8),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              'Observações: ' + e.observacao)),
                                      ButtonBar(
                                        children: [
                                          OutlineButton.icon(
                                              onPressed: () =>
                                                  controller.verFotos(e),
                                              icon: Icon(FontAwesome5.camera),
                                              label: Text('Ver Fotos'))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList()
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
