// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itens_ambiente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItensAmbienteModel _$ItensAmbienteModelFromJson(Map<String, dynamic> json) {
  return ItensAmbienteModel(
    item: _$enumDecodeNullable(_$ItensAmbienteEnumMap, json['item']),
    quantidade: json['quantidade'] as int,
    estadoItens:
        _$enumDecodeNullable(_$EstadoItensEnumMap, json['estadoItens']),
    cor: json['cor'] as String,
    observacao: json['observacao'] as String,
    photoUrl: (json['photoUrl'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ItensAmbienteModelToJson(ItensAmbienteModel instance) =>
    <String, dynamic>{
      'item': _$ItensAmbienteEnumMap[instance.item],
      'quantidade': instance.quantidade,
      'estadoItens': _$EstadoItensEnumMap[instance.estadoItens],
      'cor': instance.cor,
      'observacao': instance.observacao,
      'photoUrl': instance.photoUrl,
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

const _$ItensAmbienteEnumMap = {
  ItensAmbiente.PAREDE: 'PAREDE',
  ItensAmbiente.PISO: 'PISO',
  ItensAmbiente.TETO: 'TETO',
  ItensAmbiente.LUMINARIAS: 'LUMINARIAS',
  ItensAmbiente.TOMADAS_E_INTERRUPTORES: 'TOMADAS_E_INTERRUPTORES',
  ItensAmbiente.AR_CONDICIONADO: 'AR_CONDICIONADO',
  ItensAmbiente.PORTA: 'PORTA',
  ItensAmbiente.TORNEIRA: 'TORNEIRA',
  ItensAmbiente.ARMARIO: 'ARMARIO',
};

const _$EstadoItensEnumMap = {
  EstadoItens.NOVO: 'NOVO',
  EstadoItens.BOM: 'BOM',
  EstadoItens.REGULAR: 'REGULAR',
  EstadoItens.RUIM: 'RUIM',
};
