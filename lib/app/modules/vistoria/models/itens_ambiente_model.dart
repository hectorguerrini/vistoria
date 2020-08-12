import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:vistoria/app/enumeration/estado_itens_enum.dart';
import 'package:vistoria/app/enumeration/itens_ambiente_enum.dart';
part 'itens_ambiente_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ItensAmbienteModel {
  final ItensAmbiente item;
  final int quantidade;
  final EstadoItens estadoItens;
  final String cor;
  final String observacao;
  final String photoUrl;
  @JsonKey(ignore: true)
  final List<File> fileImages;
  ItensAmbienteModel(
      {this.item,
      this.quantidade,
      this.estadoItens,
      this.cor,
      this.observacao,
      this.photoUrl,
      this.fileImages});

  copyWith(
      {ItensAmbiente item,
      int quantidade,
      EstadoItens estadoItens,
      String cor,
      String observacao,
      String photoUrl,
      List<File> fileImages}) {
    return ItensAmbienteModel(
      item: item ?? this.item,
      estadoItens: estadoItens ?? this.estadoItens,
      quantidade: quantidade ?? this.quantidade,
      cor: cor ?? this.cor,
      observacao: observacao ?? this.observacao,
      photoUrl: photoUrl ?? this.photoUrl,
      fileImages: fileImages ?? this.fileImages,
    );
  }

  factory ItensAmbienteModel.fromJson(Map<String, dynamic> json) =>
      _$ItensAmbienteModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItensAmbienteModelToJson(this);
}
