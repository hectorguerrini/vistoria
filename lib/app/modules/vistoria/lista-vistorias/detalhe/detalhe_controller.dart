import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_ambiente_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';
part 'detalhe_controller.g.dart';

class DetalheController = _DetalheControllerBase with _$DetalheController;

abstract class _DetalheControllerBase with Store {
  @observable
  VistoriaModel vistoriaModel;
  _DetalheControllerBase() {
    vistoriaModel = Modular.args.data;
  }
  @action
  verFotos(VistoriaAmbienteModel item) {
    Modular.to.pushNamed('/vistoria/galeria', arguments: item);
  }
}
