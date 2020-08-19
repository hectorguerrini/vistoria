import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vistoria/app/modules/cadastro/lista-imoveis/lista_imoveis_controller.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/enumeration/tipo_imovel_enum.dart';

class ListaImoveisPage extends StatefulWidget {
  final String title;
  final bool modoSelecao;
  const ListaImoveisPage(
      {Key key, this.title = 'Lista de imoveis', this.modoSelecao = false})
      : super(key: key);
  @override
  _ListaImoveisPageState createState() => _ListaImoveisPageState();
}

class _ListaImoveisPageState
    extends ModularState<ListaImoveisPage, ListaImoveisController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: 'Buscar',
                    hintText: 'Buscar por nome, cpf.',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
              Observer(builder: (_) {
                if (controller.listImoveis.hasError) {
                  return Center(
                      child: RaisedButton(
                          onPressed: controller.getListaImoveis,
                          child: Text('Carregar')));
                }
                if (controller.listImoveis.value == null) {
                  return Center(child: CircularProgressIndicator());
                }

                List<ImovelModel> list = controller.listImoveis.value;

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
                    ImovelModel item = list[index];
                    return ListTile(
                      onTap: () async {
                        if (widget.modoSelecao) {
                          controller.selecionarImovel(item);
                        } else {
                          controller.editarImovel(item);
                        }
                      },
                      title: Text.rich(TextSpan(children: [
                        TextSpan(text: item.tipoImovel.toShortString()),
                        TextSpan(text: ' - '),
                        TextSpan(
                            text:
                                "${item.enderecoModel.logradouro} ${item.enderecoModel.numero}")
                      ])),
                      subtitle: Text.rich(TextSpan(children: [
                        if (item.enderecoModel.complemento != '')
                          TextSpan(text: item.enderecoModel.complemento + '\n'),
                        TextSpan(text: "Cep: "),
                        TextSpan(text: item.enderecoModel.cep)
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
        ));
  }
}
