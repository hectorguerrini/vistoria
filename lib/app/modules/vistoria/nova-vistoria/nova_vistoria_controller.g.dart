// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nova_vistoria_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NovaVistoriaController on _NovaVistoriaControllerBase, Store {
  Computed<ImovelModel> _$getImovelModelComputed;

  @override
  ImovelModel get getImovelModel => (_$getImovelModelComputed ??=
          Computed<ImovelModel>(() => super.getImovelModel,
              name: '_NovaVistoriaControllerBase.getImovelModel'))
      .value;
  Computed<ClienteModel> _$getLocatarioComputed;

  @override
  ClienteModel get getLocatario => (_$getLocatarioComputed ??=
          Computed<ClienteModel>(() => super.getLocatario,
              name: '_NovaVistoriaControllerBase.getLocatario'))
      .value;
  Computed<List<VistoriaAmbienteModel>> _$getListAmbientesComputed;

  @override
  List<VistoriaAmbienteModel> get getListAmbientes =>
      (_$getListAmbientesComputed ??= Computed<List<VistoriaAmbienteModel>>(
              () => super.getListAmbientes,
              name: '_NovaVistoriaControllerBase.getListAmbientes'))
          .value;

  final _$currentStepAtom =
      Atom(name: '_NovaVistoriaControllerBase.currentStep');

  @override
  int get currentStep {
    _$currentStepAtom.reportRead();
    return super.currentStep;
  }

  @override
  set currentStep(int value) {
    _$currentStepAtom.reportWrite(value, super.currentStep, () {
      super.currentStep = value;
    });
  }

  final _$vistoriaModelAtom =
      Atom(name: '_NovaVistoriaControllerBase.vistoriaModel');

  @override
  VistoriaModel get vistoriaModel {
    _$vistoriaModelAtom.reportRead();
    return super.vistoriaModel;
  }

  @override
  set vistoriaModel(VistoriaModel value) {
    _$vistoriaModelAtom.reportWrite(value, super.vistoriaModel, () {
      super.vistoriaModel = value;
    });
  }

  final _$_NovaVistoriaControllerBaseActionController =
      ActionController(name: '_NovaVistoriaControllerBase');

  @override
  dynamic next() {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.next');
    try {
      return super.next();
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cancel() {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.cancel');
    try {
      return super.cancel();
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic goTo(int step) {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.goTo');
    try {
      return super.goTo(step);
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImovelModel(ImovelModel value) {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.setImovelModel');
    try {
      return super.setImovelModel(value);
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectImovel() {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.selectImovel');
    try {
      return super.selectImovel();
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLocatario(ClienteModel value) {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.setLocatario');
    try {
      return super.setLocatario(value);
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectLocatario() {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.selectLocatario');
    try {
      return super.selectLocatario();
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItensAmbientes(int index) {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.addItensAmbientes');
    try {
      return super.addItensAmbientes(index);
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentStep: ${currentStep},
vistoriaModel: ${vistoriaModel},
getImovelModel: ${getImovelModel},
getLocatario: ${getLocatario},
getListAmbientes: ${getListAmbientes}
    ''';
  }
}