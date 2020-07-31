import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
          padding: EdgeInsets.all(20),
          child: Observer(builder: (_) {
            return Stepper(
                onStepContinue: controller.next,
                onStepCancel: controller.cancel,
                currentStep: controller.currentStep,
                steps: [
                  Step(
                    title: Text("Selecionar Imovel"),
                    content: Card(
                        child: FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.add, color: Colors.black54),
                            label: Text('Buscar',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black54)))),
                  ),
                  Step(
                    title: Text("Selecionar Locatario"),
                    content: Card(
                        child: FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.add, color: Colors.black54),
                            label: Text('Buscar',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black54)))),
                  )
                ]);
          }),
        ));
  }
}
