import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';

import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';

class ListaVistoriasRepository {
  final CollectionReference _vistoriasCollection =
      FirebaseFirestore.instance.collection('vistorias');
  ListaVistoriasRepository();

  Future<List<VistoriaModel>> getVistorias() async {
    var lista = (await _vistoriasCollection.get())
        .docs
        .map((e) => VistoriaModel.fromJson(e.data())..reference = e.reference)
        .toList();
    var res = await Future.wait(lista.map((e) async {
      e = e.copyWith(
          imovelModel: await e.imovelModel.reference.get().then((value) =>
              ImovelModel.fromJson(value.data())..reference = value.reference));

      return e;
    }));
    return res;
  }
}
