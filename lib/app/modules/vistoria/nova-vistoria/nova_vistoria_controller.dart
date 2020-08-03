import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_ambiente_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';
part 'nova_vistoria_controller.g.dart';

class NovaVistoriaController = _NovaVistoriaControllerBase
    with _$NovaVistoriaController;

abstract class _NovaVistoriaControllerBase with Store {
  @observable
  int currentStep;

  @observable
  VistoriaModel vistoriaModel = new VistoriaModel();

  _NovaVistoriaControllerBase() {
    currentStep = 0;
  }

  @action
  next() {
    currentStep++;
  }

  @action
  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  @action
  goTo(int step) {
    currentStep = step;
  }

  @action
  setImovelModel(ImovelModel value) =>
      vistoriaModel = vistoriaModel.copyWith(imovelModel: value);

  @computed
  ImovelModel get getImovelModel => vistoriaModel.imovelModel;

  @action
  selectImovel() {
    Modular.to
        .pushNamed('/cadastro/lista_imoveis', arguments: true)
        .then((value) {
      setImovelModel(value);
      List<VistoriaAmbienteModel> list = [];
      vistoriaModel.imovelModel.listAmbientes.forEach((element) {
        for (var i = 0; i < element.quantidade; i++) {
          list.add(
              VistoriaAmbienteModel(ambiente: element.ambiente, listItens: []));
        }
      });
      vistoriaModel = vistoriaModel.copyWith(listAmbientes: list);
    });
  }

  @action
  setLocatario(ClienteModel value) =>
      vistoriaModel = vistoriaModel.copyWith(locatario: value);

  @computed
  ClienteModel get getLocatario => vistoriaModel.locatario;

  @action
  selectLocatario() {
    Modular.to
        .pushNamed('/cadastro/lista_clientes', arguments: true)
        .then((value) => setLocatario(value));
  }

  @computed
  List<VistoriaAmbienteModel> get getListAmbientes =>
      vistoriaModel.listAmbientes;

  @action
  addItensAmbientes(int index) {
    Modular.to.pushNamed('/vistoria/itens_ambiente').then((value) =>
        vistoriaModel.listAmbientes[index].copyWith(listItens: value));
  }

  StepState getStepState(int index, dynamic value) {
    if (index == currentStep) {
      return StepState.editing;
    } else if (currentStep > index && value == null) {
      return StepState.error;
    } else if (currentStep > index && value != null) {
      return StepState.complete;
    }
    return StepState.indexed;
  }
}
