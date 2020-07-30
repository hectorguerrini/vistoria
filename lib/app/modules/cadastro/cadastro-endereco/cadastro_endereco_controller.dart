import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/cadastro/models/endereco_model.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_endereco_repository.dart';
import 'package:vistoria/app/shared/components/message_dialog.dart';
part 'cadastro_endereco_controller.g.dart';

class CadastroEnderecoController = _CadastroEnderecoControllerBase
    with _$CadastroEnderecoController;

abstract class _CadastroEnderecoControllerBase with Store {
  final CadastroEnderecoRepository _repository;
  final TextEditingController cepCtrl =
      new MaskedTextController(mask: '00000-000');

  final TextEditingController logCtrl = new TextEditingController();

  final TextEditingController numCtrl = new TextEditingController();

  final TextEditingController comCtrl = new TextEditingController();
  final TextEditingController bairCtrl = new TextEditingController();

  final TextEditingController cidCtrl = new TextEditingController();

  final TextEditingController ufCtrl = new TextEditingController();

  Key formKey;
  @observable
  bool isLoading = false;

  @observable
  EnderecoModel enderecoModel;

  _CadastroEnderecoControllerBase(this._repository) {
    setEndereco(Modular.args.data ?? new EnderecoModel());
  }

  @action
  setEndereco(EnderecoModel value) {
    enderecoModel = value;
    cepCtrl.text = enderecoModel.cep;
    logCtrl.text = getLogradouro;
    numCtrl.text = getNumero;
    comCtrl.text = getComplemento;
    bairCtrl.text = getBairro;
    cidCtrl.text = getBairro;
    ufCtrl.text = getUf;
  }

  @action
  setCep(String value) async {
    if (cepCtrl.value.text.length == 9) {
      isLoading = true;
      try {
        var response =
            await _repository.getCep(cepCtrl.value.text.replaceFirst('-', ''));
        setEndereco(response);
      } on Exception catch (e) {
        Modular.to.showDialog(
            builder: (context) => MessageDialog(
                  mensagem: 'Cep invalido',
                ));
      }

      isLoading = false;
      enderecoModel = enderecoModel.copyWith(cep: cepCtrl.value.text);
    }
  }

  @action
  setLogradouro(String value) =>
      enderecoModel = enderecoModel.copyWith(lagradouro: value);

  @action
  setNumero(String value) =>
      enderecoModel = enderecoModel.copyWith(numero: value);

  @action
  setComplemento(String value) =>
      enderecoModel = enderecoModel.copyWith(complemento: value);

  @action
  setBairro(String value) =>
      enderecoModel = enderecoModel.copyWith(bairro: value);

  @action
  setCidade(String value) =>
      enderecoModel = enderecoModel.copyWith(cidade: value);

  @action
  setUf(String value) => enderecoModel = enderecoModel.copyWith(uf: value);

  @computed
  String get getCep => enderecoModel.cep;

  @computed
  String get getLogradouro => enderecoModel.logradouro;

  @computed
  String get getNumero => enderecoModel.numero;

  @computed
  String get getComplemento => enderecoModel.complemento;

  @computed
  String get getBairro => enderecoModel.bairro;

  @computed
  String get getCidade => enderecoModel.cidade;

  @computed
  String get getUf => enderecoModel.uf;

  @action
  save() {
    Modular.to.pop(enderecoModel);
  }
}
