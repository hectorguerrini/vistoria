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
  Computed<TipoVistoria> _$getTipoVistoriaComputed;

  @override
  TipoVistoria get getTipoVistoria => (_$getTipoVistoriaComputed ??=
          Computed<TipoVistoria>(() => super.getTipoVistoria,
              name: '_NovaVistoriaControllerBase.getTipoVistoria'))
      .value;
  Computed<List<ClienteModel>> _$getLocatarioComputed;

  @override
  List<ClienteModel> get getLocatario => (_$getLocatarioComputed ??=
          Computed<List<ClienteModel>>(() => super.getLocatario,
              name: '_NovaVistoriaControllerBase.getLocatario'))
      .value;
  Computed<List<ClienteModel>> _$getFiadorComputed;

  @override
  List<ClienteModel> get getFiador => (_$getFiadorComputed ??=
          Computed<List<ClienteModel>>(() => super.getFiador,
              name: '_NovaVistoriaControllerBase.getFiador'))
      .value;
  Computed<List<VistoriaAmbienteModel>> _$getListAmbientesComputed;

  @override
  List<VistoriaAmbienteModel> get getListAmbientes =>
      (_$getListAmbientesComputed ??= Computed<List<VistoriaAmbienteModel>>(
              () => super.getListAmbientes,
              name: '_NovaVistoriaControllerBase.getListAmbientes'))
          .value;
  Computed<bool> _$isCompleteComputed;

  @override
  bool get isComplete =>
      (_$isCompleteComputed ??= Computed<bool>(() => super.isComplete,
              name: '_NovaVistoriaControllerBase.isComplete'))
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

  final _$listAmbientesAtom =
      Atom(name: '_NovaVistoriaControllerBase.listAmbientes');

  @override
  ObservableList<VistoriaAmbienteModel> get listAmbientes {
    _$listAmbientesAtom.reportRead();
    return super.listAmbientes;
  }

  @override
  set listAmbientes(ObservableList<VistoriaAmbienteModel> value) {
    _$listAmbientesAtom.reportWrite(value, super.listAmbientes, () {
      super.listAmbientes = value;
    });
  }

  final _$obsCtrlAtom = Atom(name: '_NovaVistoriaControllerBase.obsCtrl');

  @override
  TextEditingController get obsCtrl {
    _$obsCtrlAtom.reportRead();
    return super.obsCtrl;
  }

  @override
  set obsCtrl(TextEditingController value) {
    _$obsCtrlAtom.reportWrite(value, super.obsCtrl, () {
      super.obsCtrl = value;
    });
  }

  final _$descCtrlAtom = Atom(name: '_NovaVistoriaControllerBase.descCtrl');

  @override
  TextEditingController get descCtrl {
    _$descCtrlAtom.reportRead();
    return super.descCtrl;
  }

  @override
  set descCtrl(TextEditingController value) {
    _$descCtrlAtom.reportWrite(value, super.descCtrl, () {
      super.descCtrl = value;
    });
  }

  final _$saveAsyncAction = AsyncAction('_NovaVistoriaControllerBase.save');

  @override
  Future save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$willPopAsyncAction =
      AsyncAction('_NovaVistoriaControllerBase.willPop');

  @override
  Future<bool> willPop() {
    return _$willPopAsyncAction.run(() => super.willPop());
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
  dynamic setTipoVistoria(TipoVistoria value) {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.setTipoVistoria');
    try {
      return super.setTipoVistoria(value);
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
  dynamic setLocatario(List<ClienteModel> value) {
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
  dynamic setFiador(List<ClienteModel> value) {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.setFiador');
    try {
      return super.setFiador(value);
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectFiador() {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.selectFiador');
    try {
      return super.selectFiador();
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItensAmbientes(int index, {VistoriaAmbienteModel item}) {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.addItensAmbientes');
    try {
      return super.addItensAmbientes(index, item: item);
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescricaoAmbiente(String value, dynamic index) {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.setDescricaoAmbiente');
    try {
      return super.setDescricaoAmbiente(value, index);
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setObservacaoAmbiente(String value, dynamic index) {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.setObservacaoAmbiente');
    try {
      return super.setObservacaoAmbiente(value, index);
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStep(int step) {
    final _$actionInfo = _$_NovaVistoriaControllerBaseActionController
        .startAction(name: '_NovaVistoriaControllerBase.setStep');
    try {
      return super.setStep(step);
    } finally {
      _$_NovaVistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentStep: ${currentStep},
vistoriaModel: ${vistoriaModel},
listAmbientes: ${listAmbientes},
obsCtrl: ${obsCtrl},
descCtrl: ${descCtrl},
getImovelModel: ${getImovelModel},
getTipoVistoria: ${getTipoVistoria},
getLocatario: ${getLocatario},
getFiador: ${getFiador},
getListAmbientes: ${getListAmbientes},
isComplete: ${isComplete}
    ''';
  }
}
