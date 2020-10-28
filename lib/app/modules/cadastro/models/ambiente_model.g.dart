// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ambiente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmbienteModel _$AmbienteModelFromJson(Map<String, dynamic> json) {
  return AmbienteModel(
    ambiente: _$enumDecodeNullable(_$AmbientesEnumMap, json['ambiente']),
    quantidade: json['quantidade'] as int,
  );
}

Map<String, dynamic> _$AmbienteModelToJson(AmbienteModel instance) =>
    <String, dynamic>{
      'ambiente': _$AmbientesEnumMap[instance.ambiente],
      'quantidade': instance.quantidade,
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
  Ambientes.AREA_SERVICO: 'AREA_SERVICO',
  Ambientes.BANHEIROS: 'BANHEIROS',
  Ambientes.CHURRASQUEIRA: 'CHURRASQUEIRA',
  Ambientes.CORREDOR: 'CORREDOR',
  Ambientes.COZINHA: 'COZINHA',
  Ambientes.EDICULA: 'EDICULA',
  Ambientes.GARAGEM: 'GARAGEM',
  Ambientes.QUARTO: 'QUARTO',
  Ambientes.QUINTAL: 'QUINTAL',
  Ambientes.SALA: 'SALA',
  Ambientes.SUITES: 'SUITES',
  Ambientes.VARANDA: 'VARANDA',
  Ambientes.AREA_EXTERNA: 'AREA_EXTERNA',
};
