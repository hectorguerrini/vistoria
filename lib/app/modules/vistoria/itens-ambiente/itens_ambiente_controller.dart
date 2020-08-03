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
  List<ItensAmbienteModel> listItens = [];

  @observable
  ItensAmbienteModel itens = new ItensAmbienteModel();

  _ItensAmbienteControllerBase();

  @action
  addItem() {
    Modular.to.showDialog(builder: (context) => CadastroItensAmbienteDialog());
  }

  @computed
  List<ItensAmbienteModel> get getListItens => listItens;

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
}
