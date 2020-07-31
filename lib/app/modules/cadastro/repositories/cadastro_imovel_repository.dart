import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/shared/interfaces/local_storage_interface.dart';

class CadastroImovelRepository {
  final ILocalStorage _storage;

  CadastroImovelRepository(this._storage);

  Future saveImovel(ImovelModel imovelModel) async {
    var imoveis = await _storage.get('imoveis');
    if (imoveis == null) imoveis = [];
    imoveis.add(imovelModel.toJson());
    _storage.put('imoveis', imoveis);
  }

  Future<List<ImovelModel>> getListImoveis() async {
    var imoveis = await _storage.get('imoveis');
    if (imoveis == null) imoveis = [];
    List<ImovelModel> lista = [];
    for (var item in imoveis) {
      var json = Map<String, dynamic>.from(item);
      lista.add(ImovelModel.fromJson(json));
    }
    return lista;
  }
}
