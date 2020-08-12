import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/enumeration/estado_itens_enum.dart';
import 'package:vistoria/app/enumeration/itens_ambiente_enum.dart';
import 'package:vistoria/app/modules/vistoria/components/cadastro_itens_ambiente_dialog.dart';
import 'package:vistoria/app/modules/vistoria/models/itens_ambiente_model.dart';
part 'itens_ambiente_controller.g.dart';

class ItensAmbienteController = _ItensAmbienteControllerBase
    with _$ItensAmbienteController;

abstract class _ItensAmbienteControllerBase with Store {
  final picker = ImagePicker();

  @observable
  ObservableList<ItensAmbienteModel> listItens =
      new ObservableList<ItensAmbienteModel>();

  @observable
  ItensAmbienteModel itens = new ItensAmbienteModel(fileImages: []);

  _ItensAmbienteControllerBase() {
    if (Modular.args.data != null) {
      List<ItensAmbienteModel> list = Modular.args.data;
      listItens = list.asObservable();
    }
  }

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
  bool get isFieldsValid => itens.item != null && itens.estadoItens != null;

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
      if (value != null) {
        listItens[index] = value;
      }
    }).whenComplete(() => itens = new ItensAmbienteModel());
  }

  @action
  photoItens(ItensAmbienteModel value, int index) async {
    final photo = await picker.getImage(
        source: ImageSource.camera, maxWidth: 1024, maxHeight: 768);
    value.fileImages.add(File(photo.path));
    listItens[index] =
        listItens.elementAt(index).copyWith(fileImages: value.fileImages);
  }

  @action
  abrirGaleria(ItensAmbienteModel value, int index) {
    Modular.to.pushNamed('/galeria', arguments: value.fileImages).then((value) {
      if (value != null) {
        print(value);
        listItens[index] = value;
      }
    });
  }

  @action
  save() {
    Modular.to.pop(listItens.toList());
  }
}
