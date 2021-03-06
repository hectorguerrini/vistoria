import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:vistoria/app/enumeration/tipo_imovel_enum.dart';
import 'package:vistoria/app/modules/cadastro/components/cadastro_ambiente_dialog.dart';
import 'package:vistoria/app/modules/cadastro/cadastro-imovel/cadastro_imovel_controller.dart';
import 'package:vistoria/app/modules/cadastro/models/ambiente_model.dart';
import 'package:vistoria/app/modules/cadastro/components/card_ambiente.dart';
import 'package:vistoria/app/modules/cadastro/models/endereco_model.dart';
import 'package:vistoria/app/shared/components/custom_floating_button_save.dart';

class CadastroImovelPage extends StatefulWidget {
  final String title;

  const CadastroImovelPage({Key key, this.title = "Cadastro de Imovel"})
      : super(key: key);

  @override
  _CadastroImovelPageState createState() => _CadastroImovelPageState();
}

class _CadastroImovelPageState
    extends ModularState<CadastroImovelPage, CadastroImovelController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              Card(
                child: Observer(builder: (_) {
                  if (controller.getProprietario == null) {
                    return FlatButton.icon(
                        onPressed: controller.selectProprietario,
                        icon: Icon(Icons.add, color: Colors.black54),
                        label: Text('Selecionar um Proprietario',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54)));
                  }

                  return ListTile(
                    title: Text(controller.getProprietario.nomeCompleto),
                    subtitle: Text(controller.getProprietario.celular),
                    trailing: IconButton(
                      onPressed: controller.selectProprietario,
                      icon: Icon(FontAwesome.pencil),
                    ),
                  );
                }),
              ),
              Card(
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[500])),
                child: Observer(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 7.0, horizontal: 15),
                    child: DropdownButton(
                        isExpanded: true,
                        underline: Container(height: 0),
                        hint: Text('Tipo do Imovel'),
                        value: controller.getTipoImovel,
                        items: TipoImovel.values
                            .map((e) => DropdownMenuItem(
                                child: Text(e.toShortString()), value: e))
                            .toList(),
                        onChanged: controller.setTipoImovel),
                  );
                }),
              ),
              Card(
                child: Observer(builder: (_) {
                  if (controller.getEndereco == null) {
                    return FlatButton.icon(
                        onPressed: controller.addEndereco,
                        icon: Icon(Icons.add, color: Colors.black54),
                        label: Text('Adicionar Endereço',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54)));
                  }
                  EnderecoModel end = controller.getEndereco;
                  return ListTile(
                      leading: Icon(Icons.home),
                      trailing: IconButton(
                          icon: Icon(FontAwesome.pencil),
                          onPressed: controller.editEndereco),
                      title:
                          Text('${end.logradouro}  Nº ${end.numero ?? 'S/N'}'),
                      subtitle: Text.rich(
                        TextSpan(children: [
                          if (end.complemento != '')
                            TextSpan(text: '${end.complemento}\n'),
                          TextSpan(text: '${end.cidade}/${end.uf}\n'),
                          TextSpan(text: 'CEP: ${end.cep}'),
                        ]),
                      ));
                }),
              ),
              Card(
                child: TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      labelText: 'Observações', border: OutlineInputBorder()),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text('Ambientes do Imovel',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Center(
                child: IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      size: 48,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => new CadastroAmbienteDialog());
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Observer(builder: (_) {
                  List<AmbienteModel> lista =
                      controller.imovelModel.listAmbientes;

                  if (lista.length == 0) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          'Nenhum Ambiente cadastrado',
                          style: TextStyle(fontSize: 14, color: Colors.black45),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      AmbienteModel item = lista[index];
                      return CardAmbiente(item: item);
                    },
                  );
                }),
              ),
            ],
          )),
      floatingActionButton: CustomFloatingButtonSave(f: controller.save),
    );
  }
}
