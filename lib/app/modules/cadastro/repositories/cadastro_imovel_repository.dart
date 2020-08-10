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

  Future<List<ImovelModel>> getListImoveis() async {
    var lista = await _imoveisCollection
        .getDocuments()
        .then((value) => value.documents);
    List<Map> listImov = [];
    lista.forEach((element) async {
      (element.data['proprietario'] as DocumentReference)
          .get()
          .then((value) => value.data);
    });
  }
}
