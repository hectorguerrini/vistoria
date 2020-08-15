import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';
import 'package:vistoria/app/modules/vistoria/repositories/nova_vistoria_repository.dart';
part 'lista_vistorias_controller.g.dart';

class ListaVistoriasController = _ListaVistoriasControllerBase
    with _$ListaVistoriasController;

abstract class _ListaVistoriasControllerBase with Store {
  final NovaVistoriaRepository _repository;

  @observable
  ObservableStream<List<VistoriaModel>> listVistoria;

  _ListaVistoriasControllerBase(this._repository) {
    if (listVistoria != null) {
      getListaVistoria();
    }
  }

  getListaVistoria() {
    listVistoria = _repository.getVistorias().asObservable();
  }
}
