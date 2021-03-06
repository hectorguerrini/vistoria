// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_imovel_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroImovelController on _CadastroImovelControllerBase, Store {
  Computed<ClienteModel> _$getProprietarioComputed;

  @override
  ClienteModel get getProprietario => (_$getProprietarioComputed ??=
          Computed<ClienteModel>(() => super.getProprietario,
              name: '_CadastroImovelControllerBase.getProprietario'))
      .value;
  Computed<EnderecoModel> _$getEnderecoComputed;

  @override
  EnderecoModel get getEndereco => (_$getEnderecoComputed ??=
          Computed<EnderecoModel>(() => super.getEndereco,
              name: '_CadastroImovelControllerBase.getEndereco'))
      .value;
  Computed<TipoImovel> _$getTipoImovelComputed;

  @override
  TipoImovel get getTipoImovel => (_$getTipoImovelComputed ??=
          Computed<TipoImovel>(() => super.getTipoImovel,
              name: '_CadastroImovelControllerBase.getTipoImovel'))
      .value;
  Computed<Ambientes> _$getAmbienteComputed;

  @override
  Ambientes get getAmbiente =>
      (_$getAmbienteComputed ??= Computed<Ambientes>(() => super.getAmbiente,
              name: '_CadastroImovelControllerBase.getAmbiente'))
          .value;
  Computed<String> _$getStringAmbienteComputed;

  @override
  String get getStringAmbiente => (_$getStringAmbienteComputed ??=
          Computed<String>(() => super.getStringAmbiente,
              name: '_CadastroImovelControllerBase.getStringAmbiente'))
      .value;
  Computed<int> _$getQtdeAmbienteComputed;

  @override
  int get getQtdeAmbiente =>
      (_$getQtdeAmbienteComputed ??= Computed<int>(() => super.getQtdeAmbiente,
              name: '_CadastroImovelControllerBase.getQtdeAmbiente'))
          .value;
  Computed<bool> _$isFieldsValidComputed;

  @override
  bool get isFieldsValid =>
      (_$isFieldsValidComputed ??= Computed<bool>(() => super.isFieldsValid,
              name: '_CadastroImovelControllerBase.isFieldsValid'))
          .value;

  final _$ambienteModelAtom =
      Atom(name: '_CadastroImovelControllerBase.ambienteModel');

  @override
  AmbienteModel get ambienteModel {
    _$ambienteModelAtom.reportRead();
    return super.ambienteModel;
  }

  @override
  set ambienteModel(AmbienteModel value) {
    _$ambienteModelAtom.reportWrite(value, super.ambienteModel, () {
      super.ambienteModel = value;
    });
  }

  final _$imovelModelAtom =
      Atom(name: '_CadastroImovelControllerBase.imovelModel');

  @override
  ImovelModel get imovelModel {
    _$imovelModelAtom.reportRead();
    return super.imovelModel;
  }

  @override
  set imovelModel(ImovelModel value) {
    _$imovelModelAtom.reportWrite(value, super.imovelModel, () {
      super.imovelModel = value;
    });
  }

  final _$editAmbienteAsyncAction =
      AsyncAction('_CadastroImovelControllerBase.editAmbiente');

  @override
  Future editAmbiente() {
    return _$editAmbienteAsyncAction.run(() => super.editAmbiente());
  }

  final _$saveAsyncAction = AsyncAction('_CadastroImovelControllerBase.save');

  @override
  Future save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_CadastroImovelControllerBaseActionController =
      ActionController(name: '_CadastroImovelControllerBase');

  @override
  dynamic selectProprietario() {
    final _$actionInfo = _$_CadastroImovelControllerBaseActionController
        .startAction(name: '_CadastroImovelControllerBase.selectProprietario');
    try {
      return super.selectProprietario();
    } finally {
      _$_CadastroImovelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addEndereco() {
    final _$actionInfo = _$_CadastroImovelControllerBaseActionController
        .startAction(name: '_CadastroImovelControllerBase.addEndereco');
    try {
      return super.addEndereco();
    } finally {
      _$_CadastroImovelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editEndereco() {
    final _$actionInfo = _$_CadastroImovelControllerBaseActionController
        .startAction(name: '_CadastroImovelControllerBase.editEndereco');
    try {
      return super.editEndereco();
    } finally {
      _$_CadastroImovelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTipoImovel(TipoImovel value) {
    final _$actionInfo = _$_CadastroImovelControllerBaseActionController
        .startAction(name: '_CadastroImovelControllerBase.setTipoImovel');
    try {
      return super.setTipoImovel(value);
    } finally {
      _$_CadastroImovelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addAmbiente() {
    final _$actionInfo = _$_CadastroImovelControllerBaseActionController
        .startAction(name: '_CadastroImovelControllerBase.addAmbiente');
    try {
      return super.addAmbiente();
    } finally {
      _$_CadastroImovelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteAmbiente(AmbienteModel ambienteModel) {
    final _$actionInfo = _$_CadastroImovelControllerBaseActionController
        .startAction(name: '_CadastroImovelControllerBase.deleteAmbiente');
    try {
      return super.deleteAmbiente(ambienteModel);
    } finally {
      _$_CadastroImovelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAmbienteModel(AmbienteModel value) {
    final _$actionInfo = _$_CadastroImovelControllerBaseActionController
        .startAction(name: '_CadastroImovelControllerBase.setAmbienteModel');
    try {
      return super.setAmbienteModel(value);
    } finally {
      _$_CadastroImovelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAmbiente(Ambientes value) {
    final _$actionInfo = _$_CadastroImovelControllerBaseActionController
        .startAction(name: '_CadastroImovelControllerBase.setAmbiente');
    try {
      return super.setAmbiente(value);
    } finally {
      _$_CadastroImovelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQtde(int value) {
    final _$actionInfo = _$_CadastroImovelControllerBaseActionController
        .startAction(name: '_CadastroImovelControllerBase.setQtde');
    try {
      return super.setQtde(value);
    } finally {
      _$_CadastroImovelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ambienteModel: ${ambienteModel},
imovelModel: ${imovelModel},
getProprietario: ${getProprietario},
getEndereco: ${getEndereco},
getTipoImovel: ${getTipoImovel},
getAmbiente: ${getAmbiente},
getStringAmbiente: ${getStringAmbiente},
getQtdeAmbiente: ${getQtdeAmbiente},
isFieldsValid: ${isFieldsValid}
    ''';
  }
}
