import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:vistoria/app/enumeration/tipo_imovel_enum.dart';
import 'package:vistoria/app/modules/vistoria/lista-vistorias/detalhe/detalhe_controller.dart';

class DetalhePage extends StatefulWidget {
  final String title;

  const DetalhePage({Key key, this.title = "Detalhe"}) : super(key: key);
  @override
  _DetalhePageState createState() => _DetalhePageState();
}

class _DetalhePageState extends ModularState<DetalhePage, DetalheController> {
  getStyle({double size}) {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: size);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(8, size.height * 0.1, 8, 16),
          decoration: BoxDecoration(color: Colors.greenAccent),
          child: Column(
            children: [
              Text(
                controller.vistoriaModel.imovelModel.tipoImovel.toShortString(),
                style: getStyle(size: 24),
              ),
              Text(
                controller.vistoriaModel.imovelModel.enderecoModel.logradouro +
                    ' Nº' +
                    controller.vistoriaModel.imovelModel.enderecoModel.numero,
                style: getStyle(size: 14),
              ),
              Text(
                controller.vistoriaModel.imovelModel.enderecoModel.cep,
                style: getStyle(size: 14),
              ),
              Text(
                controller.vistoriaModel.imovelModel.enderecoModel.bairro,
                style: getStyle(size: 14),
              ),
              Text(
                controller.vistoriaModel.imovelModel.enderecoModel.cidade +
                    '/' +
                    controller.vistoriaModel.imovelModel.enderecoModel.uf,
                style: getStyle(size: 14),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
