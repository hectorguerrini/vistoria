import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/enumeration/status_vistoria_enum.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_cliente_repository.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';

import 'repositories/lista_vistorias_repository.dart';
part 'lista_vistorias_controller.g.dart';

class ListaVistoriasController = _ListaVistoriasControllerBase
    with _$ListaVistoriasController;

abstract class _ListaVistoriasControllerBase with Store {
  final ListaVistoriasRepository _repository;
  final CadastroClienteRepository _clienteRepository = Modular.get();

  @observable
  ObservableFuture<List<VistoriaModel>> listVistoria;

  _ListaVistoriasControllerBase(this._repository) {
    if (listVistoria == null) {
      getListaVistoria();
    }
  }
  @action
  getListaVistoria() {
    listVistoria = _repository.getVistorias().asObservable();
  }

  @action
  selectVistoria(VistoriaModel vistoriaModel) async {
    vistoriaModel = vistoriaModel.copyWith(
        locatario: await _clienteRepository
            .getCliente(vistoriaModel.locatario.reference),
        imovelModel: vistoriaModel.imovelModel.copyWith(
            proprietario: await _clienteRepository
                .getCliente(vistoriaModel.imovelModel.proprietario.reference)));
    if (vistoriaModel.statusVistoria == StatusVistoria.RASCUNHO) {
      Modular.to
          .pushNamed('/vistoria/cadastro', arguments: vistoriaModel)
          .then((value) {
        if (value) getListaVistoria();
      });
    }
    if (vistoriaModel.statusVistoria == StatusVistoria.FINALIZADO) {
      Modular.to
          .pushNamed('/vistoria/lista/detalhe', arguments: vistoriaModel)
          .then((value) {});
    }
  }
}
