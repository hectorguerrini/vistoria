import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';
import 'package:vistoria/app/modules/vistoria/models/itens_ambiente_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_ambiente_model.dart';
import 'package:vistoria/app/modules/vistoria/repositories/vistoria_repository.dart';
import 'package:vistoria/app/shared/auth/auth_controller.dart';
part 'galeria_fotos_controller.g.dart';

class GaleriaFotosController = _GaleriaFotosControllerBase
    with _$GaleriaFotosController;

abstract class _GaleriaFotosControllerBase with Store {
  final VistoriaRepository _repository = Modular.get();
  final AuthController _authController = Modular.get();

  @observable
  ItensAmbienteModel itens;

  @observable
  ObservableList lista = [].asObservable();

  _GaleriaFotosControllerBase() {
    print(_authController.user.uid);
    if (Modular.args.data is ItensAmbienteModel) {
      itens = Modular.args.data;
      lista.addAll(itens.photoUrl);
      lista.addAll(itens.fileImages);
    } else if (Modular.args.data is VistoriaAmbienteModel) {
      VistoriaAmbienteModel ambiente = Modular.args.data;
      ambiente.listItens.forEach((element) {
        lista.addAll(element.photoUrl);
      });
    }
  }

  @action
  deleteImage(dynamic item) async {
    try {
      if (item is File) {
        var lista = itens.fileImages;
        lista.remove(item);
        itens = itens.copyWith(fileImages: lista);
        await item.delete();
      } else if (item is String) {
        var lista = itens.photoUrl;
        var deleted = await _repository.deleteImage(item);
        print('is deleted? ' + deleted.toString());
        lista.remove(item);
        itens = itens.copyWith(photoUrl: lista);
      }
      showToast('Deletado com Sucesso',
          backgroundColor: Colors.red,
          textStyle: TextStyle(color: Colors.white));
    } catch (e) {
      print(e.toString());
      showToast('Erro ao tentar deletar tente novamente',
          backgroundColor: Colors.red,
          textStyle: TextStyle(color: Colors.white));
    }
  }

  @action
  Future<bool> willPop() async {
    Modular.to.pop(itens);
    return true;
  }
}
