import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/enumeration/ambientes_enum.dart';
import 'package:vistoria/app/enumeration/tipo_imovel_enum.dart';
import 'package:vistoria/app/modules/cadastro/models/ambiente_model.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/models/endereco_model.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_imovel_repository.dart';
import 'package:vistoria/app/shared/components/message_dialog.dart';
part 'cadastro_imovel_controller.g.dart';

class CadastroImovelController = _CadastroImovelControllerBase
    with _$CadastroImovelController;

abstract class _CadastroImovelControllerBase with Store {
  final CadastroImovelRepository _repository;
  Key formKey;

  List<TipoImovel> listTipoImovel = TipoImovel.values;
  List<Ambientes> listAmbientes = Ambientes.values;
  @observable
  AmbienteModel ambienteModel = new AmbienteModel(quantidade: 0);
  @observable
  ImovelModel imovelModel = new ImovelModel(listAmbientes: []);

  _CadastroImovelControllerBase(this._repository) {
    // List<AmbienteModel> _lista = [];
    // _lista.add(new AmbienteModel(ambiente: Ambientes.SALA, quantidade: 1));
    // _lista.add(new AmbienteModel(ambiente: Ambientes.BANHEIROS, quantidade: 2));
    // _lista.add(new AmbienteModel(ambiente: Ambientes.COZINHA, quantidade: 1));
    // _lista.add(new AmbienteModel(ambiente: Ambientes.QUARTOS, quantidade: 3));
    // _lista.add(new AmbienteModel(ambiente: Ambientes.SUITES, quantidade: 2));
    // _lista.add(new AmbienteModel(ambiente: Ambientes.VARANDA, quantidade: 1));
    // _lista.add(
    //     new AmbienteModel(ambiente: Ambientes.AREA_SERVICO, quantidade: 1));
    // _lista.add(
    //     new AmbienteModel(ambiente: Ambientes.CHURRASQUEIRA, quantidade: 1));
  }
  @action
  selectProprietario() {
    Modular.to.pushNamed('/cadastro/lista_clientes', arguments: true).then(
        (value) => imovelModel = imovelModel.copyWith(proprietario: value));
  }

  @computed
  ClienteModel get getProprietario => imovelModel.proprietario;

  @action
  addEndereco() {
    Modular.to.pushNamed('/cadastro/endereco').then(
        (value) => imovelModel = imovelModel.copyWith(enderecoModel: value));
  }

  @action
  editEndereco() {
    Modular.to
        .pushNamed('/cadastro/endereco', arguments: imovelModel.enderecoModel)
        .then((value) =>
            imovelModel = imovelModel.copyWith(enderecoModel: value));
  }

  @computed
  EnderecoModel get getEndereco => imovelModel.enderecoModel;

  @action
  setTipoImovel(TipoImovel value) =>
      imovelModel = imovelModel.copyWith(tipoImovel: value);

  @computed
  TipoImovel get getTipoImovel => imovelModel.tipoImovel;

  @action
  addAmbiente() {
    List<AmbienteModel> _lista = imovelModel.listAmbientes;
    _lista.add(ambienteModel);
    imovelModel = imovelModel.copyWith(listAmbientes: _lista);
    setAmbienteModel(new AmbienteModel(quantidade: 0));
  }

  @action
  editAmbiente() async {
    List<AmbienteModel> _lista = imovelModel.listAmbientes;
    var i = _lista
        .indexWhere((element) => element.ambiente == ambienteModel.ambiente);
    _lista[i] = ambienteModel;
    imovelModel = imovelModel.copyWith(listAmbientes: _lista);
    setAmbienteModel(new AmbienteModel(quantidade: 0));
  }

  @action
  deleteAmbiente(AmbienteModel ambienteModel) {
    List<AmbienteModel> _lista = imovelModel.listAmbientes;
    _lista.remove(ambienteModel);
    imovelModel = imovelModel.copyWith(listAmbientes: _lista);
  }

  @action
  setAmbienteModel(AmbienteModel value) => ambienteModel = value;
  @action
  setAmbiente(Ambientes value) =>
      ambienteModel = ambienteModel.copyWith(ambiente: value);
  @action
  setQtde(int value) =>
      ambienteModel = ambienteModel.copyWith(quantidade: value);
  @computed
  Ambientes get getAmbiente => ambienteModel.ambiente;
  @computed
  String get getStringAmbiente => ambienteModel.ambiente != null
      ? ambienteModel.ambiente.toShortString()
      : '';
  @computed
  int get getQtdeAmbiente => ambienteModel.quantidade;
  @computed
  bool get isFieldsValid =>
      ambienteModel.ambiente != null && ambienteModel.quantidade > 0;
  @action
  save() async {
    try {
      await _repository.saveImovel(imovelModel);
      Modular.to.showDialog(
          builder: (context) => MessageDialog(
                mensagem: 'Cadastrado com Sucesso',
              ));
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
