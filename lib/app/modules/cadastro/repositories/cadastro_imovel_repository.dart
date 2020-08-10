import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/shared/interfaces/local_storage_interface.dart';

class CadastroImovelRepository {
  final ILocalStorage _storage;
  final CollectionReference _imoveisCollection =
      Firestore.instance.collection('imoveis');
  CadastroImovelRepository(this._storage);

  Future saveImovel(ImovelModel imovelModel) async {
    await _imoveisCollection.add(imovelModel.toJson());
  }

  Stream<List<ImovelModel>> getListImoveis() {
    return _imoveisCollection.snapshots().map((event) => event.documents
        .map((e) => ImovelModel.fromJson(e.data)..reference = e.reference)
        .toList());
  }
}
