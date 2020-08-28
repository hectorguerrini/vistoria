import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_cliente_repository.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_imovel_repository.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
part 'lista_imoveis_controller.g.dart';

class ListaImoveisController = _ListaImoveisControllerBase
    with _$ListaImoveisController;

abstract class _ListaImoveisControllerBase with Store {
  final CadastroImovelRepository _repository;
  final CadastroClienteRepository _clienteRepository = Modular.get();

  @observable
  ObservableStream<List<ImovelModel>> listImoveis;

  @observable
  ObservableFuture<List<ImovelModel>> listImoveisFiltered =
      new ObservableFuture.value([]);

  @observable
  String searchBar = '';
  _ListaImoveisControllerBase(this._repository) {
    if (listImoveis == null) {
      getListaImoveis();
    }
  }

  @action
  getListaSearch(String value) {
    try {
      if (value != '') {
        searchBar = value;
        listImoveisFiltered =
            _repository.getSearchImoveis(search: searchBar).asObservable();
      }
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @action
  getListaImoveis() async {
    listImoveis = _repository.getListImoveis().asObservable();
  }

  @action
  selecionarImovel(ImovelModel imovelModel) async {
    imovelModel = imovelModel.copyWith(
        proprietario: await _clienteRepository
            .getCliente(imovelModel.proprietario.reference));
    Modular.to.pop(imovelModel);
  }

  @action
  editarImovel(ImovelModel imovelModel) async {
    imovelModel = imovelModel.copyWith(
        proprietario: await _clienteRepository
            .getCliente(imovelModel.proprietario.reference));
    Modular.to.pushNamed('/cadastro/imovel', arguments: imovelModel);
  }
}
