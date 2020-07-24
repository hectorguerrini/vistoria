// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_imovel_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroImovelController on _CadastroImovelControllerBase, Store {
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

  final _$_CadastroImovelControllerBaseActionController =
      ActionController(name: '_CadastroImovelControllerBase');

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
  dynamic setQtde(String value) {
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
getTipoImovel: ${getTipoImovel},
getAmbiente: ${getAmbiente},
getStringAmbiente: ${getStringAmbiente},
isFieldsValid: ${isFieldsValid}
    ''';
  }
}
