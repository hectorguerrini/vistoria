// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vistoria_ambiente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VistoriaAmbienteModel _$VistoriaAmbienteModelFromJson(
    Map<String, dynamic> json) {
  return VistoriaAmbienteModel(
    ambiente: _$enumDecodeNullable(_$AmbientesEnumMap, json['ambiente']),
    observacao: json['observacao'] as String,
    listItens: (json['listItens'] as List)
        ?.map((e) => e == null
            ? null
            : ItensAmbienteModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VistoriaAmbienteModelToJson(
        VistoriaAmbienteModel instance) =>
    <String, dynamic>{
      'ambiente': _$AmbientesEnumMap[instance.ambiente],
      'observacao': instance.observacao,
      'listItens': instance.listItens?.map((e) => e?.toJson())?.toList(),
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

const _$AmbientesEnumMap = {
  Ambientes.SALA: 'SALA',
  Ambientes.COZINHA: 'COZINHA',
  Ambientes.AREA_SERVICO: 'AREA_SERVICO',
  Ambientes.QUARTO: 'QUARTO',
  Ambientes.SUITES: 'SUITES',
  Ambientes.BANHEIROS: 'BANHEIROS',
  Ambientes.VARANDA: 'VARANDA',
  Ambientes.CHURRASQUEIRA: 'CHURRASQUEIRA',
  Ambientes.CORREDOR: 'CORREDOR',
};
