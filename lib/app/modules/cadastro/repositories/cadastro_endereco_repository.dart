import 'package:dio/dio.dart';
import 'package:vistoria/app/modules/cadastro/models/endereco_model.dart';

class CadastroEnderecoRepository {
  final Dio dio;

  CadastroEnderecoRepository(this.dio);

  Future<EnderecoModel> getCep(String cep) async {
    var response = await dio.get("https://viacep.com.br/ws/$cep/json/");
    if ((response.data as Map<String, dynamic>).containsKey('erro')) {
      throw Exception('Cep invalido');
    }
    return EnderecoModel.fromJson(response.data);
  }
}
