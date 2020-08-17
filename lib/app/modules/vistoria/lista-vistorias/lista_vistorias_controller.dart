import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_cliente_repository.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';
import 'package:vistoria/app/modules/vistoria/repositories/nova_vistoria_repository.dart';
part 'lista_vistorias_controller.g.dart';

class ListaVistoriasController = _ListaVistoriasControllerBase
    with _$ListaVistoriasController;

abstract class _ListaVistoriasControllerBase with Store {
  final NovaVistoriaRepository _repository;
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
    Modular.to.pushNamed('/vistoria/nova_vistoria', arguments: vistoriaModel);
  }
}
