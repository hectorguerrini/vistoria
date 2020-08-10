import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/enumeration/status_vistoria_enum.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_ambiente_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';
import 'package:vistoria/app/modules/vistoria/repositories/nova_vistoria_repository.dart';
import 'package:vistoria/app/shared/auth/auth_controller.dart';
import 'package:vistoria/app/shared/components/confirmation_dialog.dart';
part 'nova_vistoria_controller.g.dart';

class NovaVistoriaController = _NovaVistoriaControllerBase
    with _$NovaVistoriaController;

abstract class _NovaVistoriaControllerBase with Store {
  final AuthController _authController = Modular.get();
  final NovaVistoriaRepository _repository;
  @observable
  int currentStep;

  @observable
  VistoriaModel vistoriaModel =
      new VistoriaModel(statusVistoria: StatusVistoria.RASCUNHO);

  @observable
  ObservableList<VistoriaAmbienteModel> listAmbientes =
      new ObservableList<VistoriaAmbienteModel>();
  @observable
  TextEditingController obsCtrl = new TextEditingController();
  @observable
  TextEditingController descCtrl = new TextEditingController();

  _NovaVistoriaControllerBase(this._repository) {
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
      if (value != null) {
        setImovelModel(value);
        List<VistoriaAmbienteModel> list = [];
        vistoriaModel.imovelModel.listAmbientes.forEach((element) {
          for (var i = 0; i < element.quantidade; i++) {
            list.add(VistoriaAmbienteModel(
                ambiente: element.ambiente, listItens: []));
          }
        });
        listAmbientes = list.asObservable();
        vistoriaModel = vistoriaModel.copyWith(listAmbientes: list);
      }
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
        .then((value) {
      if (value != null) setLocatario(value);
    });
  }

  @computed
  List<VistoriaAmbienteModel> get getListAmbientes =>
      vistoriaModel.listAmbientes;

  @action
  addItensAmbientes(int index, {VistoriaAmbienteModel item}) {
    Modular.to
        .pushNamed('/vistoria/itens_ambiente',
            arguments: item?.listItens ?? null)
        .then((value) {
      if (value != null) {
        var list = listAmbientes;
        list[index] = list[index].copyWith(listItens: value);
        listAmbientes = list.asObservable();
        vistoriaModel = vistoriaModel.copyWith(listAmbientes: list);
      }
    }).catchError((onError) {});
  }

  @action
  setDescricaoAmbiente(String value, index) =>
      listAmbientes[index] = listAmbientes[index].copyWith(descricao: value);

  @action
  setObservacaoAmbiente(String value, index) =>
      listAmbientes[index] = listAmbientes[index].copyWith(observacao: value);

  @action
  setStep(int step) {
    currentStep = step;
    if (step >= 2) {
      obsCtrl = new TextEditingController(
          text: listAmbientes[currentStep - 2].observacao);
      descCtrl = new TextEditingController(
          text: listAmbientes[currentStep - 2].descricao);
    }
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

  @action
  save() async {
    try {
      vistoriaModel =
          vistoriaModel.copyWith(listAmbientes: listAmbientes.toList());
      vistoriaModel.createUid = _authController.user.uid;
      vistoriaModel.updateUid = _authController.user.uid;
      var confimacao = await Modular.to.showDialog(
          builder: (context) => ConfirmationDialog(
                action:
                    'Salvar como ${vistoriaModel.statusVistoria.toShortString()}',
              ));

      if (confimacao) {
        vistoriaModel.reference = await _repository.saveVistoria(vistoriaModel);
      }
    } catch (e) {
      print(e.message);
    }
  }

  @action
  Future<bool> willPop() async {
    var confimacao = await Modular.to.showDialog(
        builder: (context) => ConfirmationDialog(
              action: 'Sair da Vistoria, Deseja salvar os Dados?',
            ));

    if (confimacao) {
      await save();
      return true;
    }
    return false;
  }
}
