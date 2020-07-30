// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_endereco_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroEnderecoController on _CadastroEnderecoControllerBase, Store {
  Computed<String> _$getCepComputed;

  @override
  String get getCep =>
      (_$getCepComputed ??= Computed<String>(() => super.getCep,
              name: '_CadastroEnderecoControllerBase.getCep'))
          .value;
  Computed<String> _$getLogradouroComputed;

  @override
  String get getLogradouro =>
      (_$getLogradouroComputed ??= Computed<String>(() => super.getLogradouro,
              name: '_CadastroEnderecoControllerBase.getLogradouro'))
          .value;
  Computed<String> _$getNumeroComputed;

  @override
  String get getNumero =>
      (_$getNumeroComputed ??= Computed<String>(() => super.getNumero,
              name: '_CadastroEnderecoControllerBase.getNumero'))
          .value;
  Computed<String> _$getComplementoComputed;

  @override
  String get getComplemento =>
      (_$getComplementoComputed ??= Computed<String>(() => super.getComplemento,
              name: '_CadastroEnderecoControllerBase.getComplemento'))
          .value;
  Computed<String> _$getBairroComputed;

  @override
  String get getBairro =>
      (_$getBairroComputed ??= Computed<String>(() => super.getBairro,
              name: '_CadastroEnderecoControllerBase.getBairro'))
          .value;
  Computed<String> _$getCidadeComputed;

  @override
  String get getCidade =>
      (_$getCidadeComputed ??= Computed<String>(() => super.getCidade,
              name: '_CadastroEnderecoControllerBase.getCidade'))
          .value;
  Computed<String> _$getUfComputed;

  @override
  String get getUf => (_$getUfComputed ??= Computed<String>(() => super.getUf,
          name: '_CadastroEnderecoControllerBase.getUf'))
      .value;

  final _$isLoadingAtom =
      Atom(name: '_CadastroEnderecoControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$enderecoModelAtom =
      Atom(name: '_CadastroEnderecoControllerBase.enderecoModel');

  @override
  EnderecoModel get enderecoModel {
    _$enderecoModelAtom.reportRead();
    return super.enderecoModel;
  }

  @override
  set enderecoModel(EnderecoModel value) {
    _$enderecoModelAtom.reportWrite(value, super.enderecoModel, () {
      super.enderecoModel = value;
    });
  }

  final _$setCepAsyncAction =
      AsyncAction('_CadastroEnderecoControllerBase.setCep');

  @override
  Future setCep(String value) {
    return _$setCepAsyncAction.run(() => super.setCep(value));
  }

  final _$_CadastroEnderecoControllerBaseActionController =
      ActionController(name: '_CadastroEnderecoControllerBase');

  @override
  dynamic setEndereco(EnderecoModel value) {
    final _$actionInfo = _$_CadastroEnderecoControllerBaseActionController
        .startAction(name: '_CadastroEnderecoControllerBase.setEndereco');
    try {
      return super.setEndereco(value);
    } finally {
      _$_CadastroEnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLogradouro(String value) {
    final _$actionInfo = _$_CadastroEnderecoControllerBaseActionController
        .startAction(name: '_CadastroEnderecoControllerBase.setLogradouro');
    try {
      return super.setLogradouro(value);
    } finally {
      _$_CadastroEnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNumero(String value) {
    final _$actionInfo = _$_CadastroEnderecoControllerBaseActionController
        .startAction(name: '_CadastroEnderecoControllerBase.setNumero');
    try {
      return super.setNumero(value);
    } finally {
      _$_CadastroEnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setComplemento(String value) {
    final _$actionInfo = _$_CadastroEnderecoControllerBaseActionController
        .startAction(name: '_CadastroEnderecoControllerBase.setComplemento');
    try {
      return super.setComplemento(value);
    } finally {
      _$_CadastroEnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBairro(String value) {
    final _$actionInfo = _$_CadastroEnderecoControllerBaseActionController
        .startAction(name: '_CadastroEnderecoControllerBase.setBairro');
    try {
      return super.setBairro(value);
    } finally {
      _$_CadastroEnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCidade(String value) {
    final _$actionInfo = _$_CadastroEnderecoControllerBaseActionController
        .startAction(name: '_CadastroEnderecoControllerBase.setCidade');
    try {
      return super.setCidade(value);
    } finally {
      _$_CadastroEnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUf(String value) {
    final _$actionInfo = _$_CadastroEnderecoControllerBaseActionController
        .startAction(name: '_CadastroEnderecoControllerBase.setUf');
    try {
      return super.setUf(value);
    } finally {
      _$_CadastroEnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save() {
    final _$actionInfo = _$_CadastroEnderecoControllerBaseActionController
        .startAction(name: '_CadastroEnderecoControllerBase.save');
    try {
      return super.save();
    } finally {
      _$_CadastroEnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
enderecoModel: ${enderecoModel},
getCep: ${getCep},
getLogradouro: ${getLogradouro},
getNumero: ${getNumero},
getComplemento: ${getComplemento},
getBairro: ${getBairro},
getCidade: ${getCidade},
getUf: ${getUf}
    ''';
  }
}
