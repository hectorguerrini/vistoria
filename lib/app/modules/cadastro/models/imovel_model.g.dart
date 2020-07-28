// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imovel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImovelModel _$ImovelModelFromJson(Map<String, dynamic> json) {
  return ImovelModel(
    proprietario: json['proprietario'] == null
        ? null
        : ClienteModel.fromJson(json['proprietario'] as Map<String, dynamic>),
    tipoImovel: _$enumDecodeNullable(_$TipoImovelEnumMap, json['tipoImovel']),
    listAmbientes: (json['listAmbientes'] as List)
        ?.map((e) => e == null
            ? null
            : AmbienteModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    observacao: json['observacao'] as String,
  );
}

Map<String, dynamic> _$ImovelModelToJson(ImovelModel instance) =>
    <String, dynamic>{
      'proprietario': instance.proprietario,
      'tipoImovel': _$TipoImovelEnumMap[instance.tipoImovel],
      'listAmbientes': instance.listAmbientes,
      'observacao': instance.observacao,
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

const _$TipoImovelEnumMap = {
  TipoImovel.CASA: 'CASA',
  TipoImovel.APARTAMENTO: 'APARTAMENTO',
  TipoImovel.SALA: 'SALA',
  TipoImovel.GALPAO: 'GALPAO',
};
