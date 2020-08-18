import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/enumeration/estado_itens_enum.dart';
import 'package:vistoria/app/enumeration/itens_ambiente_enum.dart';
import 'package:vistoria/app/modules/vistoria/cadastro-vistoria/components/cadastro_itens_ambiente_dialog.dart';
import 'package:vistoria/app/modules/vistoria/models/itens_ambiente_model.dart';
import 'package:vistoria/app/shared/components/confirmation_saved_dialog.dart';
part 'itens_ambiente_controller.g.dart';

class ItensAmbienteController = _ItensAmbienteControllerBase
    with _$ItensAmbienteController;

abstract class _ItensAmbienteControllerBase with Store {
  final picker = ImagePicker();

  @observable
  ObservableList<ItensAmbienteModel> listItens =
      new ObservableList<ItensAmbienteModel>();

  @observable
  ItensAmbienteModel itens =
      new ItensAmbienteModel(fileImages: [], photoUrl: []);

  _ItensAmbienteControllerBase() {
    if (Modular.args.data != null) {
      List<ItensAmbienteModel> list = Modular.args.data;
      list = list.map((e) => e.copyWith(fileImages: [])).toList();
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
    }).whenComplete(
            () => itens = new ItensAmbienteModel(fileImages: [], photoUrl: []));
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
    }).whenComplete(
            () => itens = new ItensAmbienteModel(fileImages: [], photoUrl: []));
  }

  @action
  photoItens(ItensAmbienteModel value, int index) async {
    try {
      final photo = await picker.getImage(
          source: ImageSource.camera, maxWidth: 1024, maxHeight: 768);
      if (photo != null) {
        value.fileImages.add(File(photo.path));
        listItens[index] =
            listItens.elementAt(index).copyWith(fileImages: value.fileImages);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @action
  abrirGaleria(ItensAmbienteModel value, int index) {
    Modular.to.pushNamed('/vistoria/galeria', arguments: value).then((value) {
      if (value is ItensAmbienteModel) {
        listItens[index] = listItens
            .elementAt(index)
            .copyWith(fileImages: value.fileImages, photoUrl: value.photoUrl);
      }
    });
  }

  @action
  save() {
    Modular.to.pop(listItens.toList());
  }

  @action
  Future<bool> willPop() async {
    var confirmacao = await Modular.to
        .showDialog(builder: (context) => ConfirmationSavedDialog());
    if (confirmacao) {
      save();
    } else {
      Modular.to.pop();
    }
    return true;
  }
}
