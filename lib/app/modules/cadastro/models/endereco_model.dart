import 'package:json_annotation/json_annotation.dart';

part 'endereco_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EnderecoModel {
  final String cep;
  final String logradouro;
  @JsonKey(defaultValue: '')
  final String numero;
  final String complemento;
  final String bairro;
  @JsonKey(name: 'localidade')
  final String cidade;
  final String uf;

  EnderecoModel(
      {this.cep,
      this.logradouro,
      this.numero,
      this.complemento,
      this.bairro,
      this.cidade,
      this.uf});

  copyWith(
      {String cep,
      String lagradouro,
      String numero,
      String complemento,
      String bairro,
      String cidade,
      String uf}) {
    return EnderecoModel(
        cep: cep ?? this.cep,
        logradouro: lagradouro ?? this.logradouro,
        numero: numero ?? this.numero,
        complemento: complemento ?? this.complemento,
        bairro: bairro ?? this.bairro,
        cidade: cidade ?? this.cidade,
        uf: uf ?? this.uf);
  }

  factory EnderecoModel.fromJson(Map<String, dynamic> json) =>
      _$EnderecoModelFromJson(json);
  Map<String, dynamic> toJson() => _$EnderecoModelToJson(this);
}
