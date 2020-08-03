import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vistoria/app/enumeration/tipo_imovel_enum.dart';
import 'package:vistoria/app/enumeration/ambientes_enum.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/modules/vistoria/nova-vistoria/nova_vistoria_controller.dart';

class NovaVistoriaPage extends StatefulWidget {
  final String title;

  const NovaVistoriaPage({Key key, this.title = 'Realizar Vistoria'})
      : super(key: key);

  @override
  _NovaVistoriaPageState createState() => _NovaVistoriaPageState();
}

class _NovaVistoriaPageState
    extends ModularState<NovaVistoriaPage, NovaVistoriaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Observer(builder: (_) {
            List<Step> listSteps = [
              Step(
                state: controller.getStepState(0, controller.getImovelModel),
                isActive: controller.currentStep >= 0,
                title: Text("Selecionar Imovel"),
                content: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(child: Observer(builder: (_) {
                    if (controller.getImovelModel == null) {
                      return FlatButton.icon(
                          onPressed: controller.selectImovel,
                          icon: Icon(Icons.search, color: Colors.black54),
                          label: Text('Selecionar',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black54)));
                    }
                    ImovelModel imovel = controller.getImovelModel;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(15.0),
                          child: Text(imovel.tipoImovel.toShortString()),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(15.0),
                          child: Text.rich(TextSpan(children: [
                            TextSpan(text: imovel.enderecoModel.logradouro),
                            TextSpan(
                                text: ' Nº ${imovel.enderecoModel.numero}\n'),
                            if (imovel.enderecoModel.complemento != null)
                              TextSpan(
                                  text:
                                      "${imovel.enderecoModel.complemento}\n"),
                            TextSpan(text: imovel.enderecoModel.cep)
                          ])),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(15.0),
                          child: Text.rich(
                              TextSpan(text: "Proprietario:\n", children: [
                            TextSpan(
                                text: "${imovel.proprietario.nomeCompleto}\n"),
                            TextSpan(text: "${imovel.proprietario.cpf}\n"),
                            TextSpan(text: "${imovel.proprietario.celular}\n"),
                          ])),
                        )
                      ],
                    );
                  })),
                ),
              ),
              Step(
                state: controller.getStepState(1, controller.getLocatario),
                isActive: controller.currentStep >= 1,
                title: Text("Selecionar Locatario"),
                content: Card(child: Observer(builder: (_) {
                  if (controller.getLocatario == null) {
                    return FlatButton.icon(
                        onPressed: controller.selectLocatario,
                        icon: Icon(Icons.add, color: Colors.black54),
                        label: Text('Adicionar Locatario',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54)));
                  }
                  ClienteModel locatario = controller.getLocatario;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        title: Text(locatario.nomeCompleto),
                        subtitle: Text.rich(TextSpan(children: [
                          TextSpan(text: "${locatario.cpf}\n"),
                          TextSpan(text: "Cel: ${locatario.celular}")
                        ])),
                      ),
                      Divider(),
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        title: Text(
                            "${locatario.endereco.logradouro} Nº${locatario.endereco.numero}"),
                        subtitle: Text.rich(
                          TextSpan(children: [
                            if (locatario.endereco.complemento != '')
                              TextSpan(
                                  text: '${locatario.endereco.complemento}\n'),
                            TextSpan(
                                text:
                                    '${locatario.endereco.cidade}/${locatario.endereco.uf}\n'),
                            TextSpan(text: 'CEP: ${locatario.endereco.cep}'),
                          ]),
                        ),
                      )
                    ],
                  );
                })),
              )
            ];

            if (controller.getListAmbientes != null) {
              controller.getListAmbientes.asMap().forEach((index, e) {
                Step step = new Step(
                    isActive: controller.currentStep >= index + 2,
                    title: Text("${e.ambiente.toShortString()}"),
                    content: Column(
                      children: <Widget>[
                        Card(
                          child: TextFormField(
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                labelText: 'Observações',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Card(
                          child: Observer(builder: (_) {
                            if (controller
                                    .getListAmbientes[index].listItens.length ==
                                0) {
                              return FlatButton.icon(
                                  onPressed: () =>
                                      controller.addItensAmbientes(index),
                                  icon: Icon(Icons.add, color: Colors.black54),
                                  label: Text('Adicionar Itens',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black54)));
                            }
                            return ListTile(
                              title: Text(
                                  '${controller.getListAmbientes.length} ambientes'),
                            );
                          }),
                        )
                      ],
                    ));
                listSteps.add(step);
              });
            }

            return Stepper(
                key: Key(Random.secure().nextDouble().toString()),
                onStepContinue: controller.next,
                onStepCancel: controller.cancel,
                onStepTapped: controller.goTo,
                currentStep: controller.currentStep,
                type: StepperType.vertical,
                steps: listSteps);
          }),
        ));
  }
}
