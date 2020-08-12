// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itens_ambiente_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItensAmbienteController on _ItensAmbienteControllerBase, Store {
  Computed<ItensAmbiente> _$getItemAmbienteComputed;

  @override
  ItensAmbiente get getItemAmbiente => (_$getItemAmbienteComputed ??=
          Computed<ItensAmbiente>(() => super.getItemAmbiente,
              name: '_ItensAmbienteControllerBase.getItemAmbiente'))
      .value;
  Computed<EstadoItens> _$getEstadoComputed;

  @override
  EstadoItens get getEstado =>
      (_$getEstadoComputed ??= Computed<EstadoItens>(() => super.getEstado,
              name: '_ItensAmbienteControllerBase.getEstado'))
          .value;
  Computed<bool> _$isFieldsValidComputed;

  @override
  bool get isFieldsValid =>
      (_$isFieldsValidComputed ??= Computed<bool>(() => super.isFieldsValid,
              name: '_ItensAmbienteControllerBase.isFieldsValid'))
          .value;

  final _$listItensAtom = Atom(name: '_ItensAmbienteControllerBase.listItens');

  @override
  ObservableList<ItensAmbienteModel> get listItens {
    _$listItensAtom.reportRead();
    return super.listItens;
  }

  @override
  set listItens(ObservableList<ItensAmbienteModel> value) {
    _$listItensAtom.reportWrite(value, super.listItens, () {
      super.listItens = value;
    });
  }

  final _$itensAtom = Atom(name: '_ItensAmbienteControllerBase.itens');

  @override
  ItensAmbienteModel get itens {
    _$itensAtom.reportRead();
    return super.itens;
  }

  @override
  set itens(ItensAmbienteModel value) {
    _$itensAtom.reportWrite(value, super.itens, () {
      super.itens = value;
    });
  }

  final _$photoItensAsyncAction =
      AsyncAction('_ItensAmbienteControllerBase.photoItens');

  @override
  Future photoItens(ItensAmbienteModel value, int index) {
    return _$photoItensAsyncAction.run(() => super.photoItens(value, index));
  }

  final _$_ItensAmbienteControllerBaseActionController =
      ActionController(name: '_ItensAmbienteControllerBase');

  @override
  dynamic setItemAmbiente(ItensAmbiente value) {
    final _$actionInfo = _$_ItensAmbienteControllerBaseActionController
        .startAction(name: '_ItensAmbienteControllerBase.setItemAmbiente');
    try {
      return super.setItemAmbiente(value);
    } finally {
      _$_ItensAmbienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEstado(EstadoItens value) {
    final _$actionInfo = _$_ItensAmbienteControllerBaseActionController
        .startAction(name: '_ItensAmbienteControllerBase.setEstado');
    try {
      return super.setEstado(value);
    } finally {
      _$_ItensAmbienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setObservacoes(String value) {
    final _$actionInfo = _$_ItensAmbienteControllerBaseActionController
        .startAction(name: '_ItensAmbienteControllerBase.setObservacoes');
    try {
      return super.setObservacoes(value);
    } finally {
      _$_ItensAmbienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItemAmbiente() {
    final _$actionInfo = _$_ItensAmbienteControllerBaseActionController
        .startAction(name: '_ItensAmbienteControllerBase.addItemAmbiente');
    try {
      return super.addItemAmbiente();
    } finally {
      _$_ItensAmbienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItem() {
    final _$actionInfo = _$_ItensAmbienteControllerBaseActionController
        .startAction(name: '_ItensAmbienteControllerBase.addItem');
    try {
      return super.addItem();
    } finally {
      _$_ItensAmbienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editItemAmbiente(ItensAmbienteModel value, int index) {
    final _$actionInfo = _$_ItensAmbienteControllerBaseActionController
        .startAction(name: '_ItensAmbienteControllerBase.editItemAmbiente');
    try {
      return super.editItemAmbiente(value, index);
    } finally {
      _$_ItensAmbienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic abrirGaleria(ItensAmbienteModel value, int index) {
    final _$actionInfo = _$_ItensAmbienteControllerBaseActionController
        .startAction(name: '_ItensAmbienteControllerBase.abrirGaleria');
    try {
      return super.abrirGaleria(value, index);
    } finally {
      _$_ItensAmbienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save() {
    final _$actionInfo = _$_ItensAmbienteControllerBaseActionController
        .startAction(name: '_ItensAmbienteControllerBase.save');
    try {
      return super.save();
    } finally {
      _$_ItensAmbienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listItens: ${listItens},
itens: ${itens},
getItemAmbiente: ${getItemAmbiente},
getEstado: ${getEstado},
isFieldsValid: ${isFieldsValid}
    ''';
  }
}
