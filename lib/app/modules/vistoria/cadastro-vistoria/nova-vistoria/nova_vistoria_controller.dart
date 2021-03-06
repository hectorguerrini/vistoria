import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/enumeration/status_vistoria_enum.dart';
import 'package:vistoria/app/enumeration/itens_ambiente_enum.dart';
import 'package:vistoria/app/enumeration/ambientes_enum.dart';
import 'package:vistoria/app/enumeration/tipo_vistoria_enum.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_ambiente_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';
import 'package:vistoria/app/modules/vistoria/repositories/vistoria_repository.dart';
import 'package:vistoria/app/shared/auth/auth_controller.dart';
import 'package:vistoria/app/shared/components/confirmation_dialog.dart';
import 'package:vistoria/app/shared/components/confirmation_saved_dialog.dart';
part 'nova_vistoria_controller.g.dart';

class NovaVistoriaController = _NovaVistoriaControllerBase
    with _$NovaVistoriaController;

abstract class _NovaVistoriaControllerBase with Store {
  final AuthController _authController = Modular.get();
  final VistoriaRepository _repository;
  @observable
  int currentStep;

  @observable
  VistoriaModel vistoriaModel;

  @observable
  double progress = 0;

  @observable
  ObservableList<VistoriaAmbienteModel> listAmbientes;
  @observable
  TextEditingController obsCtrl = new TextEditingController();
  @observable
  TextEditingController descCtrl = new TextEditingController();

  _NovaVistoriaControllerBase(this._repository) {
    currentStep = 0;
    vistoriaModel = Modular.args.data ??
        new VistoriaModel(
            statusVistoria: StatusVistoria.RASCUNHO,
            locatarios: [],
            fiador: [],
            listAmbientes: []);
    listAmbientes = vistoriaModel.listAmbientes?.asObservable() ??
        new ObservableList<VistoriaAmbienteModel>();
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
  setTipoVistoria(TipoVistoria value) =>
      vistoriaModel = vistoriaModel.copyWith(tipoVistoria: value);

  @computed
  TipoVistoria get getTipoVistoria => vistoriaModel.tipoVistoria;

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
  setLocatario(List<ClienteModel> value) =>
      vistoriaModel = vistoriaModel.copyWith(locatarios: value);

  @computed
  List<ClienteModel> get getLocatario => vistoriaModel.locatarios;

  @action
  selectLocatario() {
    Modular.to
        .pushNamed('/cadastro/lista_clientes', arguments: true)
        .then((value) {
      if (value != null) {
        List<ClienteModel> list = vistoriaModel.locatarios;
        list.add(value);
        setLocatario(list);
      }
    });
  }

  @action
  setFiador(List<ClienteModel> value) =>
      vistoriaModel = vistoriaModel.copyWith(fiador: value);

  @computed
  List<ClienteModel> get getFiador => vistoriaModel.fiador;

  @action
  selectFiador() {
    Modular.to
        .pushNamed('/cadastro/lista_clientes', arguments: true)
        .then((value) {
      if (value != null) {
        List<ClienteModel> list = vistoriaModel.fiador;
        list.add(value);
        setFiador(list);
      }
    });
  }

  @computed
  List<VistoriaAmbienteModel> get getListAmbientes =>
      vistoriaModel.listAmbientes;

  @action
  addItensAmbientes(int index, {VistoriaAmbienteModel item}) {
    Modular.to
        .pushNamed('/vistoria/cadastro/itens_ambiente',
            arguments: listAmbientes[index].listItens ?? null)
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
    if (step >= 4 && currentStep - 4 < listAmbientes.length) {
      obsCtrl = new TextEditingController(
          text: listAmbientes[currentStep - 4].observacao);
      descCtrl = new TextEditingController(
          text: listAmbientes[currentStep - 4].descricao);
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

  @computed
  bool get isComplete =>
      getImovelModel != null &&
      getLocatario != null &&
      listAmbientes.any((element) =>
          element.descricao != null &&
          element.observacao != null &&
          element.listItens.length > 0);

  @action
  save() async {
    try {
      if (isComplete)
        vistoriaModel =
            vistoriaModel.copyWith(statusVistoria: StatusVistoria.FINALIZADO);

      vistoriaModel =
          vistoriaModel.copyWith(listAmbientes: listAmbientes.toList());
      vistoriaModel.createUid = _authController.user.uid;
      vistoriaModel.updateUid = _authController.user.uid;
      var confimacao = await Modular.to.showDialog(
          builder: (context) => ConfirmationDialog(
                action:
                    'Salvar como ${vistoriaModel.statusVistoria.toShortString()}',
              ));

      Modular.to.showDialog(
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text('Salvando imagens'),
          content: Observer(builder: (_) {
            return LinearProgressIndicator(
              value: progress,
            );
          }),
          actions: [
            Observer(builder: (_) {
              return Text('${progress * 100}');
            })
          ],
        ),
      );
      var total = listAmbientes
          .map((element) => element.listItens != null &&
                  element.listItens.length > 0
              ? element.listItens
                  .map((e) => e.fileImages != null ? e.fileImages.length : 0)
                  .reduce((value, element) => value + element)
              : 0)
          .reduce((value, element) => value + element);

      if (confimacao) {
        vistoriaModel.reference = await _repository.saveVistoria(vistoriaModel);
        var i = 0;
        await Future.wait(vistoriaModel.listAmbientes.map((e) async {
          if (e.listItens != null) {
            await Future.wait(e.listItens.map((element) async {
              var lista =
                  element.fileImages != null ? [...element.fileImages] : null;
              if (lista != null) {
                int saveds = element.photoUrl.length;
                await Future.wait(lista.map((el) async {
                  int n = lista.indexOf(el);
                  String uri = await _repository.uploadImages(
                      el,
                      vistoriaModel.reference.id,
                      vistoriaModel.listAmbientes.indexOf(e).toString() +
                          e.ambiente.toShortString(),
                      element.item.toShortString(),
                      n + saveds);
                  element.photoUrl.add(uri);
                  element.fileImages.remove(el);
                  i += 1;
                  progress = i / total;
                }));
              }
            }));
          }
        }));
        vistoriaModel.reference = await _repository.saveVistoria(vistoriaModel);
        Modular.to.pop(true);
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<bool> willPop() async {
    var confirmacao = await Modular.to
        .showDialog(builder: (context) => ConfirmationSavedDialog());
    if (confirmacao) {
      save();
    } else {
      Modular.to.pop(false);
    }

    return true;
  }
}
