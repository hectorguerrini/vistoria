import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'galeria_fotos_controller.g.dart';

class GaleriaFotosController = _GaleriaFotosControllerBase
    with _$GaleriaFotosController;

abstract class _GaleriaFotosControllerBase with Store {
  @observable
  ObservableList<File> listPhotos = new ObservableList();

  _GaleriaFotosControllerBase() {
    listPhotos = (Modular.args.data as List<File>).asObservable();
  }
}
