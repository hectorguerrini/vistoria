import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';
import 'package:vistoria/app/modules/vistoria/models/itens_ambiente_model.dart';
import 'package:vistoria/app/modules/vistoria/repositories/nova_vistoria_repository.dart';
part 'galeria_fotos_controller.g.dart';

class GaleriaFotosController = _GaleriaFotosControllerBase
    with _$GaleriaFotosController;

abstract class _GaleriaFotosControllerBase with Store {
  final NovaVistoriaRepository _repository = Modular.get();

  @observable
  ItensAmbienteModel itens;

  _GaleriaFotosControllerBase() {
    itens = Modular.args.data;
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
