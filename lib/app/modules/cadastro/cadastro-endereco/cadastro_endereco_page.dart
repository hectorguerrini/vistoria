import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vistoria/app/modules/cadastro/cadastro-endereco/cadastro_endereco_controller.dart';
import 'package:vistoria/app/shared/components/custom_floating_button_save.dart';

class CadastroEnderecoPage extends StatefulWidget {
  final String title;

  const CadastroEnderecoPage({Key key, this.title = 'Cadastro de Endereço'})
      : super(key: key);

  @override
  _CadastroEnderecoPageState createState() => _CadastroEnderecoPageState();
}

class _CadastroEnderecoPageState
    extends ModularState<CadastroEnderecoPage, CadastroEnderecoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
          child: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Card(
            child: Observer(builder: (_) {
              return TextFormField(
                onChanged: controller.setCep,
                controller: controller.cepCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'CEP',
                    border: OutlineInputBorder(),
                    suffix: controller.isLoading
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                )),
                          )
                        : null),
              );
            }),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Card(
                    child: TextFormField(
                  onChanged: controller.setLogradouro,
                  controller: controller.logCtrl,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      labelText: 'Endereço', border: OutlineInputBorder()),
                )),
              ),
              Expanded(
                flex: 1,
                child: Card(
                    child: TextFormField(
                  onChanged: controller.setNumero,
                  controller: controller.numCtrl,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Número', border: OutlineInputBorder()),
                )),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Card(
                    child: TextFormField(
                  onChanged: controller.setComplemento,
                  controller: controller.comCtrl,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      labelText: 'Complemento', border: OutlineInputBorder()),
                )),
              ),
              Expanded(
                flex: 1,
                child: Card(
                    child: TextFormField(
                  onChanged: controller.setBairro,
                  controller: controller.bairCtrl,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      labelText: 'Bairro', border: OutlineInputBorder()),
                )),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Card(
                    child: TextFormField(
                  onChanged: controller.setCidade,
                  controller: controller.cidCtrl,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      labelText: 'Cidade', border: OutlineInputBorder()),
                )),
              ),
              Expanded(
                flex: 1,
                child: Card(
                    child: TextFormField(
                  onChanged: controller.setUf,
                  controller: controller.ufCtrl,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Estado', border: OutlineInputBorder()),
                )),
              ),
            ],
          ),
        ],
      )),
      floatingActionButton: CustomFloatingButtonSave(f: controller.save),
    );
  }
}
