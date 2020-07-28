import 'package:json_annotation/json_annotation.dart';
import 'package:vistoria/app/enumeration/tipo_imovel_enum.dart';

import 'ambiente_model.dart';
import 'cliente_model.dart';

part 'imovel_model.g.dart';

@JsonSerializable()
class ImovelModel {
  final ClienteModel proprietario;
  final TipoImovel tipoImovel;
  final List<AmbienteModel> listAmbientes;
  final String observacao;

  ImovelModel(
      {this.proprietario,
      this.tipoImovel,
      this.listAmbientes,
      this.observacao});

  copyWith(
      {ClienteModel proprietario,
      TipoImovel tipoImovel,
      List<AmbienteModel> listAmbientes,
      String observacao}) {
    return ImovelModel(
        proprietario: proprietario ?? this.proprietario,
        tipoImovel: tipoImovel ?? this.tipoImovel,
        listAmbientes: listAmbientes ?? this.listAmbientes,
        observacao: observacao ?? this.observacao);
  }

  factory ImovelModel.fromJson(Map<String, dynamic> json) =>
      _$ImovelModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImovelModelToJson(this);
}
