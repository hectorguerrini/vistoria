import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/shared/interfaces/local_storage_interface.dart';

class CadastroImovelRepository {
  final ILocalStorage _storage;
  final CollectionReference _imoveisCollection =
      Firestore.instance.collection('imoveis');
  CadastroImovelRepository(this._storage);

  Future<DocumentReference> saveImovel(ImovelModel imovelModel) async {
    if (imovelModel.reference != null) {
      await imovelModel.reference.updateData(imovelModel.toJson());
      return imovelModel.reference;
    } else {
      return await _imoveisCollection.add(imovelModel.toJson());
    }
  }

  Future<List<ImovelModel>> getSearchImoveis({String search}) async {
    return await _imoveisCollection
        .where('enderecoModel.logradouro',
            isGreaterThanOrEqualTo: search.toUpperCase())
        .where('enderecoModel.logradouro',
            isLessThan: search.toLowerCase() + "\uf8ff")
        .getDocuments()
        .then((value) => value.documents
            .map((e) => ImovelModel.fromJson(e.data)..reference = e.reference)
            .toList());
  }

  Stream<List<ImovelModel>> getListImoveis() {
    return _imoveisCollection.snapshots().map((event) => event.documents
        .map((e) => ImovelModel.fromJson(e.data)..reference = e.reference)
        .toList());
  }
}
