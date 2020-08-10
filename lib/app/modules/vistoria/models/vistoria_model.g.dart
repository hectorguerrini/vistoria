// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vistoria_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VistoriaModel _$VistoriaModelFromJson(Map<String, dynamic> json) {
  return VistoriaModel(
    imovelModel: VistoriaModel._imovelModelFromJson(
        json['imovelModel'] as DocumentReference),
    locatario: VistoriaModel._locatarioFromJson(
        json['locatario'] as DocumentReference),
    fiador: json['fiador'] == null
        ? null
        : ClienteModel.fromJson(json['fiador'] as Map<String, dynamic>),
    listAmbientes: (json['listAmbientes'] as List)
        ?.map((e) => e == null
            ? null
            : VistoriaAmbienteModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statusVistoria:
        _$enumDecodeNullable(_$StatusVistoriaEnumMap, json['statusVistoria']),
  )
    ..createUid = json['createUid'] as String
    ..updateUid = json['updateUid'] as String;
}

Map<String, dynamic> _$VistoriaModelToJson(VistoriaModel instance) =>
    <String, dynamic>{
      'createUid': instance.createUid,
      'updateUid': instance.updateUid,
      'imovelModel': VistoriaModel._imovelModelToJson(instance.imovelModel),
      'locatario': VistoriaModel._locatarioToJson(instance.locatario),
      'fiador': instance.fiador?.toJson(),
      'listAmbientes':
          instance.listAmbientes?.map((e) => e?.toJson())?.toList(),
      'statusVistoria': _$StatusVistoriaEnumMap[instance.statusVistoria],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$StatusVistoriaEnumMap = {
  StatusVistoria.RASCUNHO: 'RASCUNHO',
  StatusVistoria.FINALIZADO: 'FINALIZADO',
};
