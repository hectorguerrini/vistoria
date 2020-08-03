import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vistoria/app/enumeration/ambientes_enum.dart';
part 'ambiente_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AmbienteModel {
  final Ambientes ambiente;
  final int quantidade;

  AmbienteModel({this.ambiente, this.quantidade});

  copyWith({Ambientes ambiente, int quantidade}) {
    return AmbienteModel(
        ambiente: ambiente ?? this.ambiente,
        quantidade: quantidade ?? this.quantidade);
  }

  static Icon getIcon(Ambientes ambiente) {
    Icon icon;
    switch (ambiente) {
      case Ambientes.SALA:
        icon = Icon(FontAwesome.television);
        break;
      case Ambientes.COZINHA:
        icon = Icon(FontAwesome.food);
        break;
      case Ambientes.AREA_SERVICO:
        icon = Icon(FontAwesome5.tools);
        break;
      case Ambientes.QUARTO:
        icon = Icon(FontAwesome.bed);
        break;
      case Ambientes.SUITES:
        icon = Icon(Icons.airline_seat_individual_suite);
        break;
      case Ambientes.BANHEIROS:
        icon = Icon(FontAwesome5.bath);
        break;
      case Ambientes.VARANDA:
        icon = Icon(Meteocons.sun);
        break;
      case Ambientes.CHURRASQUEIRA:
        icon = Icon(Typicons.beer);
        break;
      case Ambientes.CORREDOR:
        icon = Icon(FontAwesomeIcons.houseUser);
        break;
    }
    return icon;
  }

  factory AmbienteModel.fromJson(Map<String, dynamic> json) =>
      _$AmbienteModelFromJson(json);
  Map<String, dynamic> toJson() => _$AmbienteModelToJson(this);
}
