import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'configuracao_controller.dart';

class ConfiguracaoPage extends StatefulWidget {
  final String title;
  const ConfiguracaoPage({Key key, this.title = "Configuracao"})
      : super(key: key);

  @override
  _ConfiguracaoPageState createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState
    extends ModularState<ConfiguracaoPage, ConfiguracaoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                  child: TextFormField(
                onChanged: controller.setNome,
                initialValue: controller.nomeCompleto,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    labelText: 'Nome Completo', border: OutlineInputBorder()),
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.save();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
