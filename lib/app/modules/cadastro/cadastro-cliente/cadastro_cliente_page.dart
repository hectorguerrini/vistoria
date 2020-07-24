import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cadastro_cliente_controller.dart';

class CadastroClientePage extends StatefulWidget {
  final String title;

  const CadastroClientePage({Key key, this.title = "Cadastro de Cliente"})
      : super(key: key);
  @override
  _CadastroClientePageState createState() => _CadastroClientePageState();
}

class _CadastroClientePageState
    extends ModularState<CadastroClientePage, CadastroClienteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
          key: controller.formkey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              Card(
                child: TextFormField(
                  onChanged: controller.setNomeCompleto,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Card(
                child: TextFormField(
                  onChanged: controller.setEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Card(
                      child: TextFormField(
                        controller: controller.celularCtrl,
                        onChanged: controller.setEmail,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Celular', border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Observer(builder: (_) {
                        return CheckboxListTile(
                            title: FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.green,
                            ),
                            value: controller.isWhatsapp,
                            onChanged: controller.setIsWhastapp);
                      }))
                ],
              ),
              Card(
                child: TextFormField(
                  onChanged: controller.setEmail,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: 'Telefone', border: OutlineInputBorder()),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text('Dados Pessoais',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Card(
                child: TextFormField(
                  controller: controller.cpfCtrl,
                  onChanged: controller.setCpf,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'CPF', border: OutlineInputBorder()),
                ),
              ),
              Card(
                child: TextFormField(
                  onChanged: controller.setRg,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'RG', border: OutlineInputBorder()),
                ),
              ),
              Card(
                child: TextFormField(
                  controller: controller.dtCtrl,
                  onChanged: controller.setDtNasc,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      labelText: 'Data Nascimento',
                      border: OutlineInputBorder()),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
      ),
    );
  }
}
