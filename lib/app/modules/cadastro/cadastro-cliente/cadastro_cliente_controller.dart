import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/cadastro/models/cliente_model.dart';
import 'package:vistoria/app/modules/cadastro/models/endereco_model.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_cliente_repository.dart';
import 'package:vistoria/app/shared/auth/auth_controller.dart';
import 'package:vistoria/app/shared/components/message_dialog.dart';
import 'package:intl/intl.dart';
part 'cadastro_cliente_controller.g.dart';

class CadastroClienteController = _CadastroClienteControllerBase
    with _$CadastroClienteController;

abstract class _CadastroClienteControllerBase with Store {
  final CadastroClienteRepository _repository;
  final AuthController _authController = Modular.get();
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
    if (Modular.args.data != null) {
      clienteModel = Modular.args.data;
      celularCtrl.text = clienteModel.celular;
      cpfCtrl.text = clienteModel.cpf;
      dtCtrl.text = DateFormat('dd/MM/yyyy').format(clienteModel.dtNascimento);
    } else {
      clienteModel = new ClienteModel(isWhatsapp: false);
    }
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

  @computed
  String get getNomeCompleto => clienteModel.nomeCompleto;

  @computed
  String get getEmail => clienteModel.email;

  @computed
  String get getTelefone => clienteModel.telefone;

  @computed
  String get getCpf => clienteModel.cpf;

  @computed
  String get getRg => clienteModel.rg;

  @action
  addEndereco() {
    Modular.to
        .pushNamed('/cadastro/endereco')
        .then((value) => clienteModel = clienteModel.copyWith(endereco: value));
  }

  @action
  editEndereco() {
    Modular.to
        .pushNamed('/cadastro/endereco', arguments: clienteModel.endereco)
        .then((value) => clienteModel = clienteModel.copyWith(endereco: value));
  }

  @computed
  EnderecoModel get getEndereco => clienteModel.endereco;

  @action
  save() async {
    try {
      clienteModel.createUid = _authController.user.uid;
      clienteModel.updateUid = _authController.user.uid;
      await _repository.saveCliente(clienteModel);
      Modular.to
          .showDialog(
              builder: (context) => MessageDialog(
                    mensagem: 'Cadastrado com Sucesso',
                  ))
          .then((value) => Modular.to.pop());
    } catch (e) {
      print(e);
    }
  }
}
