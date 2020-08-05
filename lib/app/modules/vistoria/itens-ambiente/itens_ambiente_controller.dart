import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/enumeration/estado_itens_enum.dart';
import 'package:vistoria/app/enumeration/itens_ambiente_enum.dart';
import 'package:vistoria/app/modules/vistoria/components/cadastro_itens_ambiente_dialog.dart';
import 'package:vistoria/app/modules/vistoria/models/itens_ambiente_model.dart';
part 'itens_ambiente_controller.g.dart';

class ItensAmbienteController = _ItensAmbienteControllerBase
    with _$ItensAmbienteController;

abstract class _ItensAmbienteControllerBase with Store {
  @observable
  ObservableList<ItensAmbienteModel> listItens =
      new ObservableList<ItensAmbienteModel>();

  @observable
  ItensAmbienteModel itens = new ItensAmbienteModel();

  _ItensAmbienteControllerBase();

  @action
  setItemAmbiente(ItensAmbiente value) => itens = itens.copyWith(item: value);

  @action
  setEstado(EstadoItens value) => itens = itens.copyWith(estadoItens: value);

  @action
  setObservacoes(String value) => itens = itens.copyWith(observacao: value);

  @computed
  ItensAmbiente get getItemAmbiente => itens.item;

  @computed
  EstadoItens get getEstado => itens.estadoItens;

  @computed
  bool get isFieldsValid =>
      itens.item != null &&
      itens.estadoItens != null &&
      itens.observacao != null;

  @action
  addItemAmbiente() {
    listItens.add(itens);
  }

  @action
  addItem() {
    Modular.to
        .showDialog(
            builder: (context) => CadastroItensAmbienteDialog(
                  modoEdicao: false,
                ))
        .then((value) {
      if (value != null) {
        listItens.add(value);
      }
    }).whenComplete(() => itens = new ItensAmbienteModel());
  }

  @action
  editItemAmbiente(ItensAmbienteModel value, int index) {
    itens = value;
    Modular.to
        .showDialog(
            builder: (context) => CadastroItensAmbienteDialog(
                  modoEdicao: true,
                ))
        .then((value) {
      listItens[index] = value;
      itens = new ItensAmbienteModel();
    }).catchError((onError) => itens = new ItensAmbienteModel());
  }

  @action
  save() {
    Modular.to.pop(listItens.toList());
  }
}
