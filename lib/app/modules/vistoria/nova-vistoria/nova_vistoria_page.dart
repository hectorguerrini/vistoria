import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vistoria/app/enumeration/tipo_imovel_enum.dart';
import 'package:vistoria/app/enumeration/ambientes_enum.dart';
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
                state: StepState.editing,
                isActive: controller.currentStep == 0,
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(imovel.tipoImovel.toShortString()),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(8.0),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(TextSpan(children: [
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
                isActive: controller.currentStep == 1,
                title: Text("Selecionar Locatario"),
                content: Card(
                    child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.black54),
                        label: Text('Buscar',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54)))),
              )
            ];

            if (controller.getImovelModel != null) {
              controller.getImovelModel.listAmbientes.forEach((e) {
                for (var i = 0; i < e.quantidade; i++) {
                  Step step = new Step(
                      isActive: controller.currentStep == listSteps.length,
                      title: Text(
                          "${e.quantidade > 1 ? i + 1 : ''} ${e.ambiente.toShortString()}"),
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
                          )
                        ],
                      ));
                  listSteps.add(step);
                }
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
