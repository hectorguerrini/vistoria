import 'package:json_annotation/json_annotation.dart';
import 'package:vistoria/app/shared/models/base_model.dart';
part 'corretor_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CorretorModel extends BaseModel {
  final String nome;
  final String creci;

  CorretorModel({this.nome, this.creci});

  CorretorModel copyWith({String nome, String creci}) {
    return CorretorModel(nome: nome ?? this.nome, creci: creci ?? this.creci);
  }

  factory CorretorModel.fromJson(Map<String, dynamic> json) =>
      _$CorretorModelFromJson(json);
  Map<String, dynamic> toJson() => _$CorretorModelToJson(this);
}
