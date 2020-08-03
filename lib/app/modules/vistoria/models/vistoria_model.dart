import 'package:json_annotation/json_annotation.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/modules/vistoria/models/itens_ambiente_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_ambiente_model.dart';
part 'vistoria_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VistoriaModel {
  final ImovelModel imovelModel;
  final ClienteModel locatario;
  final ClienteModel fiador;
  final List<VistoriaAmbienteModel> listAmbientes;

  VistoriaModel(
      {this.imovelModel, this.locatario, this.fiador, this.listAmbientes});

  copyWith(
      {ImovelModel imovelModel,
      ClienteModel locatario,
      ClienteModel fiador,
      List<VistoriaAmbienteModel> listAmbientes}) {
    return VistoriaModel(
        imovelModel: imovelModel ?? this.imovelModel,
        locatario: locatario ?? this.locatario,
        fiador: fiador ?? this.fiador,
        listAmbientes: listAmbientes ?? this.listAmbientes);
  }

  factory VistoriaModel.fromJson(Map<String, dynamic> json) =>
      _$VistoriaModelFromJson(json);
  Map<String, dynamic> toJson() => _$VistoriaModelToJson(this);
}
