import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_cliente_repository.dart';
import 'package:vistoria/app/shared/components/message_dialog.dart';
part 'cadastro_cliente_controller.g.dart';

class CadastroClienteController = _CadastroClienteControllerBase
    with _$CadastroClienteController;

abstract class _CadastroClienteControllerBase with Store {
  final CadastroClienteRepository _repository;
  final TextEditingController celularCtrl =
      new MaskedTextController(mask: '(00) 00000-0000');
  final TextEditingController cpfCtrl =
      new MaskedTextController(mask: '000.000.000-00');
  final TextEditingController dtCtrl =
      new MaskedTextController(mask: '00/00/0000');
  Key formkey;

  @observable
  ClienteModel clienteModel;

  _CadastroClienteControllerBase(this._repository) {
    clienteModel = new ClienteModel(isWhatsapp: false);
  }
  @action
  setNomeCompleto(String value) =>
      clienteModel = clienteModel.copyWith(nomeCompleto: value);

  @action
  setEmail(String value) => clienteModel = clienteModel.copyWith(email: value);

  @action
  setCelular(String value) =>
      clienteModel = clienteModel.copyWith(celular: value);

  @action
  setTelefone(String value) =>
      clienteModel = clienteModel.copyWith(telefone: value);

  @action
  setIsWhastapp(bool value) =>
      clienteModel = clienteModel.copyWith(isWhatsapp: value);
  @action
  setCpf(String value) => clienteModel = clienteModel.copyWith(cpf: value);

  @action
  setRg(String value) => clienteModel = clienteModel.copyWith(rg: value);

  @action
  setDtNasc(String value) {
    print(dtCtrl.value.text);
    if (dtCtrl.value.text.length == 10) {
      List<String> dts = dtCtrl.value.text.split('/');
      clienteModel = clienteModel.copyWith(
          dtNascimento: DateTime.parse("${dts[2]}${dts[1]}${dts[0]}"));
    }
  }

  @computed
  bool get isWhatsapp => clienteModel.isWhatsapp;

  @action
  save() async {
    await _repository.saveCliente(clienteModel);
    Modular.to.showDialog(
        builder: (context) => MessageDialog(
              mensagem: 'Cadastrado com Sucesso',
            ));
    print('Cliente cadastrado');
  }
}
