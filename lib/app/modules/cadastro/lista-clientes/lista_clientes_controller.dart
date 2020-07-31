import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_cliente_repository.dart';
import 'package:vistoria/app/shared/components/confirmation_dialog.dart';
part 'lista_clientes_controller.g.dart';

class ListaClientesController = _ListaClientesControllerBase
    with _$ListaClientesController;

abstract class _ListaClientesControllerBase with Store {
  final CadastroClienteRepository _repository;

  @observable
  ObservableFuture<List<ClienteModel>> listClientes;

  _ListaClientesControllerBase(this._repository) {
    getListaClientes();
  }

  @action
  getListaClientes() {
    listClientes = _repository.getListClientes().asObservable();
  }

  @action
  selecionarCliente(ClienteModel clienteModel) async {
    var confimacao = await Modular.to.showDialog(
        builder: (context) => ConfirmationDialog(
              action: 'Selecionar Cliente',
            ));
    if (confimacao) {
      Modular.to.pop(clienteModel);
    }
  }
}
