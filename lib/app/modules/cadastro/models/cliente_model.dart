import 'package:json_annotation/json_annotation.dart';
import 'package:vistoria/app/modules/cadastro/models/endereco_model.dart';
import 'package:vistoria/app/shared/models/base_model.dart';
part 'cliente_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class ClienteModel extends BaseModel {
  final String nomeCompleto;
  final String email;
  final String celular;
  final String telefone;
  final bool isWhatsapp;
  final String cpf;
  final String rg;
  final DateTime dtNascimento;
  final EnderecoModel endereco;

  ClienteModel(
      {this.nomeCompleto,
      this.email,
      this.celular,
      this.telefone,
      this.isWhatsapp,
      this.cpf,
      this.rg,
      this.dtNascimento,
      this.endereco});

  copyWith(
      {String nomeCompleto,
      String email,
      String celular,
      String telefone,
      bool isWhatsapp,
      String cpf,
      String rg,
      DateTime dtNascimento,
      EnderecoModel endereco}) {
    return ClienteModel(
        nomeCompleto: nomeCompleto ?? this.nomeCompleto,
        email: email ?? this.email,
        celular: celular ?? this.celular,
        telefone: telefone ?? this.telefone,
        isWhatsapp: isWhatsapp ?? this.isWhatsapp,
        cpf: cpf ?? this.cpf,
        rg: rg ?? this.rg,
        dtNascimento: dtNascimento ?? this.dtNascimento,
        endereco: endereco ?? this.endereco)
      ..reference = this.reference;
  }

  factory ClienteModel.fromJson(Map<String, dynamic> json) =>
      _$ClienteModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClienteModelToJson(this);
}
