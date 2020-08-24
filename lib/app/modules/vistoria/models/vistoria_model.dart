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
  @JsonKey(toJson: _locatariosToJson, fromJson: _locatariosFromJson)
  final List<ClienteModel> locatarios;
  final List<ClienteModel> fiador;
  final List<VistoriaAmbienteModel> listAmbientes;
  final StatusVistoria statusVistoria;
  VistoriaModel(
      {this.tipoVistoria,
      this.imovelModel,
      this.locatarios,
      this.fiador,
      this.listAmbientes,
      this.statusVistoria});

  copyWith(
      {TipoVistoria tipoVistoria,
      ImovelModel imovelModel,
      List<ClienteModel> locatarios,
      List<ClienteModel> fiador,
      List<VistoriaAmbienteModel> listAmbientes,
      StatusVistoria statusVistoria}) {
    return VistoriaModel(
        tipoVistoria: tipoVistoria ?? this.tipoVistoria,
        imovelModel: imovelModel ?? this.imovelModel,
        locatarios: locatarios ?? this.locatarios,
        fiador: fiador ?? this.fiador,
        listAmbientes: listAmbientes ?? this.listAmbientes,
        statusVistoria: statusVistoria ?? this.statusVistoria)
      ..reference = this.reference;
  }

  static DocumentReference _imovelModelToJson(ImovelModel imovelModel) =>
      imovelModel.reference;
  static ImovelModel _imovelModelFromJson(DocumentReference ref) =>
      ImovelModel()..reference = ref;

  static List<DocumentReference> _locatariosToJson(
          List<ClienteModel> locatarios) =>
      locatarios.map((e) => e.reference).toList() ?? null;
  static List<ClienteModel> _locatariosFromJson(List ref) => ref != null
      ? ref
          .map((e) => ClienteModel()..reference = (e as DocumentReference))
          .toList()
      : [];

  factory VistoriaModel.fromJson(Map<String, dynamic> json) =>
      _$VistoriaModelFromJson(json);
  Map<String, dynamic> toJson() => _$VistoriaModelToJson(this);
}
