import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:vistoria/app/enumeration/tipo_vistoria_enum.dart';
import 'package:vistoria/app/enumeration/status_vistoria_enum.dart';
import 'package:vistoria/app/modules/vistoria/lista-vistorias/lista_vistorias_controller.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';

class ListaVistoriasPage extends StatefulWidget {
  final String title;

  const ListaVistoriasPage({Key key, this.title = 'Lista de Vistorias'})
      : super(key: key);
  @override
  _ListaVistoriasPageState createState() => _ListaVistoriasPageState();
}

class _ListaVistoriasPageState
    extends ModularState<ListaVistoriasPage, ListaVistoriasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Buscar',
                  hintText: 'Buscar por nome, cpf.',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
            ),
            Observer(builder: (_) {
              if (controller.listVistoria.error != null) {
                return Center(
                    child: RaisedButton(
                        onPressed: controller.getListaVistoria,
                        child: Text('Carregar')));
              }
              if (controller.listVistoria.value == null) {
                return Center(child: CircularProgressIndicator());
              }

              List<VistoriaModel> list = controller.listVistoria.value;

              if (list.length == 0) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Text(
                    "Nenhum imovel cadastrado",
                    style: TextStyle(color: Colors.black54),
                  )),
                );
              }

              return ListView.separated(
                padding: EdgeInsets.only(top: 16),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  VistoriaModel item = list[index];
                  IconData icone;
                  switch (item.tipoVistoria) {
                    case TipoVistoria.ENTRADA:
                      icone = Octicons.sign_in;
                      break;
                    case TipoVistoria.SAIDA:
                      icone = Octicons.sign_out;
                      break;
                  }
                  return ListTile(
                    onTap: () async {
                      controller.selectVistoria(item);
                    },
                    leading: Icon(
                      icone,
                      size: 32,
                    ),
                    title: Text(item.imovelModel.enderecoModel.logradouro +
                        " Nº" +
                        item.imovelModel.enderecoModel.numero),
                    subtitle: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: item.statusVistoria.toShortString() + '\n'),
                      TextSpan(text: '${item.listAmbientes.length} Ambientes.')
                    ])),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 1.0,
                ),
                itemCount: list.length,
              );
            }),
          ],
        ),
      ),
    );
  }
}
