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
      json["proprietario"] = Map<String, dynamic>.from(json["proprietario"]);
      json["proprietario"]["endereco"] =
          Map<String, dynamic>.from(json["proprietario"]["endereco"]);
      json["listAmbientes"] = (json["listAmbientes"] as List)
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
      json["enderecoModel"] = Map<String, dynamic>.from(json["enderecoModel"]);
      lista.add(ImovelModel.fromJson(json));
    }
    return lista;
  }
}
