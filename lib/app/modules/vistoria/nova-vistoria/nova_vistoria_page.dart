import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:vistoria/app/enumeration/tipo_imovel_enum.dart';
import 'package:vistoria/app/enumeration/ambientes_enum.dart';
import 'package:vistoria/app/enumeration/itens_ambiente_enum.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/modules/vistoria/nova-vistoria/nova_vistoria_controller.dart';
import 'package:vistoria/app/shared/components/custom_floating_button_save.dart';

class NovaVistoriaPage extends StatefulWidget {
  final String title;

  const NovaVistoriaPage({Key key, this.title = 'Realizar Vistoria'})
      : super(key: key);

  @override
  _NovaVistoriaPageState createState() => _NovaVistoriaPageState();
}

class _NovaVistoriaPageState
    extends ModularState<NovaVistoriaPage, NovaVistoriaController> {
  TextEditingController testeCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget stepLocatario() {
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
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            title: Text(locatario.nomeCompleto),
            subtitle: Text.rich(TextSpan(children: [
              TextSpan(text: "${locatario.cpf}\n"),
              TextSpan(text: "Cel: ${locatario.celular}")
            ])),
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            title: Text(
                "${locatario.endereco.logradouro} Nº${locatario.endereco.numero}"),
            subtitle: Text.rich(
              TextSpan(children: [
                if (locatario.endereco.complemento != '')
                  TextSpan(text: '${locatario.endereco.complemento}\n'),
                TextSpan(
                    text:
                        '${locatario.endereco.cidade}/${locatario.endereco.uf}\n'),
                TextSpan(text: 'CEP: ${locatario.endereco.cep}'),
              ]),
            ),
          )
        ],
      );
    }

    getListStep() {
      List<Step> listSteps = [
        Step(
          state: controller.getStepState(0, controller.getImovelModel),
          isActive: controller.currentStep >= 0,
          title: Text("Selecionar Imovel"),
          content: Container(
            alignment: Alignment.centerLeft,
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
                      TextSpan(text: ' Nº ${imovel.enderecoModel.numero}\n'),
                      if (imovel.enderecoModel.complemento.isNotEmpty)
                        TextSpan(text: "${imovel.enderecoModel.complemento}\n"),
                      TextSpan(text: imovel.enderecoModel.cep)
                    ])),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(15.0),
                    child:
                        Text.rich(TextSpan(text: "Proprietario:\n", children: [
                      TextSpan(text: "${imovel.proprietario.nomeCompleto}\n"),
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
          content: Observer(builder: (_) {
            return Card(child: stepLocatario());
          }),
        )
      ];

      if (controller.vistoriaModel.listAmbientes != null) {
        controller.vistoriaModel.listAmbientes.asMap().forEach((index, e) {
          Step step = new Step(
              subtitle: Text(e.descricao ?? 'Sem descrição'),
              state: controller.getStepState(index + 2, e.observacao),
              isActive: controller.currentStep >= index + 2,
              title: Text("${e.ambiente.toShortString()}"),
              content: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) =>
                            controller.setDescricaoAmbiente(value, index),
                        controller: controller.descCtrl,
                        maxLines: null,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            labelText: 'Descrição',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) =>
                            controller.setObservacaoAmbiente(value, index),
                        controller: controller.obsCtrl,
                        maxLines: null,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            labelText: 'Observação',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Observer(builder: (_) {
                      var len =
                          controller.listAmbientes[index].listItens.length;
                      if (len == 0) {
                        return FlatButton.icon(
                            onPressed: () =>
                                controller.addItensAmbientes(index),
                            icon: Icon(Icons.add, color: Colors.black54),
                            label: Text('Adicionar Itens',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black54)));
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ListTile(
                          title: Text(
                              '${controller.getListAmbientes[index].listItens.length} Itens'),
                          subtitle: Text.rich(TextSpan(
                              children: controller
                                  .listAmbientes[index].listItens
                                  .map((e) => TextSpan(
                                      text: '- ${e.item.toShortString()}\n'))
                                  .toList())),
                          trailing: IconButton(
                              icon: Icon(FontAwesome5.pencil_alt),
                              onPressed: () =>
                                  controller.addItensAmbientes(index, item: e)),
                        ),
                      );
                    }),
                  ],
                ),
              ));
          listSteps.add(step);
        });
      }
      return listSteps;
    }

    return WillPopScope(
      onWillPop: controller.willPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Observer(builder: (_) {
              return Stepper(
                  key: Key(Random.secure().nextDouble().toString()),
                  onStepContinue: () {
                    // setState(() {
                    controller.setStep(controller.currentStep + 1);
                    // });
                  },
                  onStepCancel: () {
                    // setState(() {
                    controller.setStep(controller.currentStep - 1);
                    // });
                  },
                  onStepTapped: (step) {
                    // setState(() {
                    controller.setStep(step);
                    // });
                  },
                  currentStep: controller.currentStep,
                  type: StepperType.vertical,
                  steps: getListStep());
            })),
        floatingActionButton: CustomFloatingButtonSave(f: controller.save),
      ),
    );
  }
}
