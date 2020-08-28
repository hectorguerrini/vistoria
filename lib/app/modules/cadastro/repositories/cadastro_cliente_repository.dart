import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/shared/interfaces/local_storage_interface.dart';

class CadastroClienteRepository {
  final ILocalStorage _storage;
  final CollectionReference _clienteCollection =
      Firestore.instance.collection('clientes');

  CadastroClienteRepository(this._storage);

  Future saveCliente(ClienteModel clienteModel) async {
    await _clienteCollection.add(clienteModel.toJson());
  }

  Future<List<ClienteModel>> getSearchClientes({String search}) async {
    return await _clienteCollection
        .where('nomeCompleto', isGreaterThanOrEqualTo: search.toUpperCase())
        .where('nomeCompleto', isLessThan: search.toLowerCase() + "\uf8ff")
        .getDocuments()
        .then((value) => value.documents
            .map((e) => ClienteModel.fromJson(e.data)..reference = e.reference)
            .toList());
  }

  Stream<List<ClienteModel>> getListClientes() {
    return _clienteCollection.orderBy('nomeCompleto').snapshots().map((event) =>
        event.documents
            .map((e) => ClienteModel.fromJson(e.data)..reference = e.reference)
            .toList());
  }

  Future<ClienteModel> getCliente(DocumentReference ref) async {
    return await ref
        .get()
        .then((value) => ClienteModel.fromJson(value.data)..reference = ref);
  }
}
