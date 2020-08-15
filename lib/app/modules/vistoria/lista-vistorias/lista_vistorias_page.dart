import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vistoria/app/enumeration/tipo_vistoria_enum.dart';
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
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: 'Buscar',
                hintText: 'Buscar por nome, cpf.',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0))),
          ),
          Observer(builder: (_) {
            if (controller.listVistoria.hasError) {
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
              padding: EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                VistoriaModel item = list[index];
                return ListTile(
                  onTap: () async {
                    // if (widget.modoSelecao) {
                    //   controller.selecionarImovel(item);
                    // }
                  },
                  title: Text(item.tipoVistoria.toShortString()),
                  subtitle: Text('${item.listAmbientes.length} Ambientes.'),
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
    );
  }
}
