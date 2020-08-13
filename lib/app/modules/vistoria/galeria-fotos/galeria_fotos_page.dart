import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:vistoria/app/modules/vistoria/galeria-fotos/galeria_fotos_controller.dart';

class GaleriaFotosPage extends StatefulWidget {
  final String title;

  const GaleriaFotosPage({Key key, this.title = 'Fotos'}) : super(key: key);
  @override
  _GaleriaFotosPageState createState() => _GaleriaFotosPageState();
}

class _GaleriaFotosPageState
    extends ModularState<GaleriaFotosPage, GaleriaFotosController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<Widget> buildImages(List lista) {
      return lista
          .map((e) => Container(
                margin: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Center(
                    child: Wrap(
                      children: [
                        if (e is File)
                          Image.file(e, width: size.width, fit: BoxFit.cover),
                        if (e is String)
                          Image.network(e,
                              width: size.width, fit: BoxFit.cover),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            width: size.width,
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      color: Colors.red,
                                      icon: Icon(
                                        FontAwesome.trash,
                                        color: Colors.white,
                                      ),
                                      onPressed: () =>
                                          controller.deleteImage(e)),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ))
          .toList();
    }

    return WillPopScope(
      onWillPop: controller.willPop,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Observer(builder: (_) {
          List lista = [
            ...controller.itens.fileImages,
            ...controller.itens.photoUrl
          ];
          return CarouselSlider(
            items: [
              ...buildImages(lista),
            ],
            options: CarouselOptions(
              height: size.height,
              enableInfiniteScroll: false,
              aspectRatio: 2.0,
              scrollDirection: Axis.horizontal,
            ),
          );
        }),
      ),
    );
  }
}
