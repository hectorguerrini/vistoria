import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vistoria/app/enumeration/tipo_imovel_enum.dart';
import 'package:vistoria/app/modules/cadastro/models/endereco_model.dart';
import 'package:vistoria/app/shared/models/base_model.dart';

import 'ambiente_model.dart';
import 'cliente_model.dart';

part 'imovel_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ImovelModel extends BaseModel {
  @JsonKey(toJson: _proprietarioToJson, fromJson: _proprietarioFromJson)
  final ClienteModel proprietario;
  final TipoImovel tipoImovel;
  final List<AmbienteModel> listAmbientes;
  final EnderecoModel enderecoModel;
  final String observacao;

  ImovelModel(
      {this.proprietario,
      this.tipoImovel,
      this.listAmbientes,
      this.enderecoModel,
      this.observacao});

  copyWith(
      {ClienteModel proprietario,
      TipoImovel tipoImovel,
      List<AmbienteModel> listAmbientes,
      EnderecoModel enderecoModel,
      String observacao}) {
    return ImovelModel(
        proprietario: proprietario ?? this.proprietario,
        tipoImovel: tipoImovel ?? this.tipoImovel,
        listAmbientes: listAmbientes ?? this.listAmbientes,
        enderecoModel: enderecoModel ?? this.enderecoModel,
        observacao: observacao ?? this.observacao)
      ..reference = this.reference;
  }

  static DocumentReference _proprietarioToJson(ClienteModel proprietario) =>
      proprietario.reference;
  static ClienteModel _proprietarioFromJson(DocumentReference ref) =>
      ClienteModel()..reference = ref;

  factory ImovelModel.fromJson(Map<String, dynamic> json) =>
      _$ImovelModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImovelModelToJson(this);
}
