import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vistoria/app/enumeration/status_vistoria_enum.dart';
import 'package:vistoria/app/enumeration/tipo_vistoria_enum.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_ambiente_model.dart';
import 'package:vistoria/app/shared/models/base_model.dart';

part 'vistoria_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VistoriaModel extends BaseModel {
  final TipoVistoria tipoVistoria;
  @JsonKey(toJson: _imovelModelToJson, fromJson: _imovelModelFromJson)
  final ImovelModel imovelModel;
  @JsonKey(toJson: _locatarioToJson, fromJson: _locatarioFromJson)
  final ClienteModel locatario;
  final ClienteModel fiador;
  final List<VistoriaAmbienteModel> listAmbientes;
  final StatusVistoria statusVistoria;
  VistoriaModel(
      {this.tipoVistoria,
      this.imovelModel,
      this.locatario,
      this.fiador,
      this.listAmbientes,
      this.statusVistoria});

  copyWith(
      {TipoVistoria tipoVistoria,
      ImovelModel imovelModel,
      ClienteModel locatario,
      ClienteModel fiador,
      List<VistoriaAmbienteModel> listAmbientes,
      StatusVistoria statusVistoria}) {
    return VistoriaModel(
        tipoVistoria: tipoVistoria ?? this.tipoVistoria,
        imovelModel: imovelModel ?? this.imovelModel,
        locatario: locatario ?? this.locatario,
        fiador: fiador ?? this.fiador,
        listAmbientes: listAmbientes ?? this.listAmbientes,
        statusVistoria: statusVistoria ?? this.statusVistoria)
      ..reference = this.reference;
  }

  static DocumentReference _imovelModelToJson(ImovelModel imovelModel) =>
      imovelModel.reference;
  static ImovelModel _imovelModelFromJson(DocumentReference ref) =>
      ImovelModel()..reference = ref;

  static DocumentReference _locatarioToJson(ClienteModel locatario) =>
      locatario.reference ?? null;
  static ClienteModel _locatarioFromJson(DocumentReference ref) =>
      ClienteModel()..reference = ref;

  factory VistoriaModel.fromJson(Map<String, dynamic> json) =>
      _$VistoriaModelFromJson(json);
  Map<String, dynamic> toJson() => _$VistoriaModelToJson(this);
}
