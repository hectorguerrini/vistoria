// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vistoria_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VistoriaModel _$VistoriaModelFromJson(Map<String, dynamic> json) {
  return VistoriaModel(
    imovelModel: json['imovelModel'] == null
        ? null
        : ImovelModel.fromJson(json['imovelModel'] as Map<String, dynamic>),
    locatario: json['locatario'] == null
        ? null
        : ClienteModel.fromJson(json['locatario'] as Map<String, dynamic>),
    fiador: json['fiador'] == null
        ? null
        : ClienteModel.fromJson(json['fiador'] as Map<String, dynamic>),
    listAmbientes: (json['listAmbientes'] as List)
        ?.map((e) => e == null
            ? null
            : VistoriaAmbienteModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VistoriaModelToJson(VistoriaModel instance) =>
    <String, dynamic>{
      'imovelModel': instance.imovelModel?.toJson(),
      'locatario': instance.locatario?.toJson(),
      'fiador': instance.fiador?.toJson(),
      'listAmbientes':
          instance.listAmbientes?.map((e) => e?.toJson())?.toList(),
    };
