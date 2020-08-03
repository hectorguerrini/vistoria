import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/shared/interfaces/local_storage_interface.dart';

class CadastroClienteRepository {
  final ILocalStorage _storage;

  CadastroClienteRepository(this._storage);

  Future saveCliente(ClienteModel clienteModel) async {
    var clientes = await _storage.get('clientes');
    if (clientes == null) clientes = [];
    clientes.add(clienteModel.toJson());
    _storage.put('clientes', clientes);
  }

  Future<List<ClienteModel>> getListClientes() async {
    var clientes = await _storage.get('clientes');
    if (clientes == null) clientes = [];
    List<ClienteModel> lista = [];
    for (var item in clientes) {
      var json = Map<String, dynamic>.from(item);
      json["endereco"] = Map<String, dynamic>.from(json["endereco"]);
      lista.add(ClienteModel.fromJson(json));
    }
    return lista;
  }
}
