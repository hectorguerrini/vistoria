import 'package:json_annotation/json_annotation.dart';
import 'package:vistoria/app/enumeration/ambientes_enum.dart';
import 'package:vistoria/app/modules/vistoria/models/itens_ambiente_model.dart';
part 'vistoria_ambiente_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VistoriaAmbienteModel {
  final Ambientes ambiente;
  final String observacao;
  final List<ItensAmbienteModel> listItens;

  VistoriaAmbienteModel({this.ambiente, this.observacao, this.listItens});

  copyWith(
      {Ambientes ambiente,
      String observacao,
      List<ItensAmbienteModel> listItens}) {
    return VistoriaAmbienteModel(
        ambiente: ambiente ?? this.ambiente,
        observacao: observacao ?? this.observacao,
        listItens: listItens ?? this.listItens);
  }

  factory VistoriaAmbienteModel.fromJson(Map<String, dynamic> json) =>
      _$VistoriaAmbienteModelFromJson(json);
  Map<String, dynamic> toJson() => _$VistoriaAmbienteModelToJson(this);
}
