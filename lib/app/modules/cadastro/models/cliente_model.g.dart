// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteModel _$ClienteModelFromJson(Map<String, dynamic> json) {
  return ClienteModel(
    nomeCompleto: json['nomeCompleto'] as String,
    email: json['email'] as String,
    celular: json['celular'] as String,
    telefone: json['telefone'] as String,
    isWhatsapp: json['isWhatsapp'] as bool,
    cpf: json['cpf'] as String,
    rg: json['rg'] as String,
    dtNascimento: json['dtNascimento'] == null
        ? null
        : DateTime.parse(json['dtNascimento'] as String),
    endereco: json['endereco'] == null
        ? null
        : EnderecoModel.fromJson(json['endereco'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClienteModelToJson(ClienteModel instance) =>
    <String, dynamic>{
      'nomeCompleto': instance.nomeCompleto,
      'email': instance.email,
      'celular': instance.celular,
      'telefone': instance.telefone,
      'isWhatsapp': instance.isWhatsapp,
      'cpf': instance.cpf,
      'rg': instance.rg,
      'dtNascimento': instance.dtNascimento?.toIso8601String(),
      'endereco': instance.endereco?.toJson(),
    };
