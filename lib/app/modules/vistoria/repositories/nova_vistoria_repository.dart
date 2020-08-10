import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';
import 'package:vistoria/app/shared/interfaces/local_storage_interface.dart';

class NovaVistoriaRepository {
  final ILocalStorage _storage;
  final CollectionReference _vistoriasCollection =
      Firestore.instance.collection('vistorias');
  NovaVistoriaRepository(this._storage);

  Future<DocumentReference> saveVistoria(VistoriaModel vistoriaModel) async {
    if (vistoriaModel.reference != null) {
      await vistoriaModel.reference.updateData(vistoriaModel.toJson());
      return vistoriaModel.reference;
    } else {
      return await _vistoriasCollection.add(vistoriaModel.toJson());
    }
  }
}
