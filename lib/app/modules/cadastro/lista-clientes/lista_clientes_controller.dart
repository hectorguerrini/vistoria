import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_cliente_repository.dart';

part 'lista_clientes_controller.g.dart';

class ListaClientesController = _ListaClientesControllerBase
    with _$ListaClientesController;

abstract class _ListaClientesControllerBase with Store {
  final CadastroClienteRepository _repository;

  @observable
  ObservableStream<List<ClienteModel>> listClientes;

  @observable
  ObservableFuture<List<ClienteModel>> listClientesFiltered =
      new ObservableFuture.value([]);

  @observable
  String searchBar = '';

  _ListaClientesControllerBase(this._repository) {
    if (listClientes == null) {
      getListaClientes();
    }
  }

  @action
  getListaSearch(String value) {
    try {
      searchBar = value;
      listClientesFiltered =
          _repository.getSearchClientes(search: searchBar).asObservable();
    } catch (e) {
      print(e);
    }
  }

  @action
  getListaClientes() {
    try {
      listClientes = _repository.getListClientes().asObservable();
    } catch (e) {
      print(e);
    }
  }

  @action
  selecionarCliente(ClienteModel clienteModel) async {
    Modular.to.pop(clienteModel);
  }

  @action
  editarCliente(ClienteModel clienteModel) async {
    Modular.to.pushNamed('/cadastro/cliente', arguments: clienteModel);
  }
}
