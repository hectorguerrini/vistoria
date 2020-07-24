// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_cliente_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroClienteController on _CadastroClienteControllerBase, Store {
  Computed<bool> _$isWhatsappComputed;

  @override
  bool get isWhatsapp =>
      (_$isWhatsappComputed ??= Computed<bool>(() => super.isWhatsapp,
              name: '_CadastroClienteControllerBase.isWhatsapp'))
          .value;

  final _$clienteModelAtom =
      Atom(name: '_CadastroClienteControllerBase.clienteModel');

  @override
  ClienteModel get clienteModel {
    _$clienteModelAtom.reportRead();
    return super.clienteModel;
  }

  @override
  set clienteModel(ClienteModel value) {
    _$clienteModelAtom.reportWrite(value, super.clienteModel, () {
      super.clienteModel = value;
    });
  }

  final _$_CadastroClienteControllerBaseActionController =
      ActionController(name: '_CadastroClienteControllerBase');

  @override
  dynamic setNomeCompleto(String value) {
    final _$actionInfo = _$_CadastroClienteControllerBaseActionController
        .startAction(name: '_CadastroClienteControllerBase.setNomeCompleto');
    try {
      return super.setNomeCompleto(value);
    } finally {
      _$_CadastroClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_CadastroClienteControllerBaseActionController
        .startAction(name: '_CadastroClienteControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CadastroClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCelular(String value) {
    final _$actionInfo = _$_CadastroClienteControllerBaseActionController
        .startAction(name: '_CadastroClienteControllerBase.setCelular');
    try {
      return super.setCelular(value);
    } finally {
      _$_CadastroClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTelefone(String value) {
    final _$actionInfo = _$_CadastroClienteControllerBaseActionController
        .startAction(name: '_CadastroClienteControllerBase.setTelefone');
    try {
      return super.setTelefone(value);
    } finally {
      _$_CadastroClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsWhastapp(bool value) {
    final _$actionInfo = _$_CadastroClienteControllerBaseActionController
        .startAction(name: '_CadastroClienteControllerBase.setIsWhastapp');
    try {
      return super.setIsWhastapp(value);
    } finally {
      _$_CadastroClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCpf(String value) {
    final _$actionInfo = _$_CadastroClienteControllerBaseActionController
        .startAction(name: '_CadastroClienteControllerBase.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_CadastroClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRg(String value) {
    final _$actionInfo = _$_CadastroClienteControllerBaseActionController
        .startAction(name: '_CadastroClienteControllerBase.setRg');
    try {
      return super.setRg(value);
    } finally {
      _$_CadastroClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDtNasc(String value) {
    final _$actionInfo = _$_CadastroClienteControllerBaseActionController
        .startAction(name: '_CadastroClienteControllerBase.setDtNasc');
    try {
      return super.setDtNasc(value);
    } finally {
      _$_CadastroClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clienteModel: ${clienteModel},
isWhatsapp: ${isWhatsapp}
    ''';
  }
}
