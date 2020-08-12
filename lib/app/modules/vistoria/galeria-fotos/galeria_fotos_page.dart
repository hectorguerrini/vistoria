import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vistoria/app/modules/vistoria/galeria-fotos/galeria_fotos_controller.dart';

class GaleriaFotosPage extends StatefulWidget {
  @override
  _GaleriaFotosPageState createState() => _GaleriaFotosPageState();
}

class _GaleriaFotosPageState
    extends ModularState<GaleriaFotosPage, GaleriaFotosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria das Fotos'),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.all(10),
          children: List.generate(
              controller.listPhotos.length,
              (index) => Card(
                    child: Image.file(controller.listPhotos[index]),
                  ))),
    );
  }
}
