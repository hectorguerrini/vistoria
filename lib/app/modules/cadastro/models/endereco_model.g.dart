// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnderecoModel _$EnderecoModelFromJson(Map<String, dynamic> json) {
  return EnderecoModel(
    cep: json['cep'] as String,
    logradouro: json['logradouro'] as String,
    numero: json['numero'] as String ?? '',
    complemento: json['complemento'] as String,
    bairro: json['bairro'] as String,
    cidade: json['localidade'] as String,
    uf: json['uf'] as String,
  );
}

Map<String, dynamic> _$EnderecoModelToJson(EnderecoModel instance) =>
    <String, dynamic>{
      'cep': instance.cep,
      'logradouro': instance.logradouro,
      'numero': instance.numero,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'localidade': instance.cidade,
      'uf': instance.uf,
    };
