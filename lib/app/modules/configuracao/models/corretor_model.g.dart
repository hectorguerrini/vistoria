// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corretor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorretorModel _$CorretorModelFromJson(Map<String, dynamic> json) {
  return CorretorModel(
    nome: json['nome'] as String,
    creci: json['creci'] as String,
  )
    ..createUid = json['createUid'] as String
    ..updateUid = json['updateUid'] as String;
}

Map<String, dynamic> _$CorretorModelToJson(CorretorModel instance) =>
    <String, dynamic>{
      'createUid': instance.createUid,
      'updateUid': instance.updateUid,
      'nome': instance.nome,
      'creci': instance.creci,
    };
