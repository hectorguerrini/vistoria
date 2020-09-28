// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on _DashboardControllerBase, Store {
  final _$numberClientesAtom =
      Atom(name: '_DashboardControllerBase.numberClientes');

  @override
  ObservableStream<int> get numberClientes {
    _$numberClientesAtom.reportRead();
    return super.numberClientes;
  }

  @override
  set numberClientes(ObservableStream<int> value) {
    _$numberClientesAtom.reportWrite(value, super.numberClientes, () {
      super.numberClientes = value;
    });
  }

  final _$numberImoveisAtom =
      Atom(name: '_DashboardControllerBase.numberImoveis');

  @override
  ObservableStream<int> get numberImoveis {
    _$numberImoveisAtom.reportRead();
    return super.numberImoveis;
  }

  @override
  set numberImoveis(ObservableStream<int> value) {
    _$numberImoveisAtom.reportWrite(value, super.numberImoveis, () {
      super.numberImoveis = value;
    });
  }

  final _$_DashboardControllerBaseActionController =
      ActionController(name: '_DashboardControllerBase');

  @override
  dynamic getIndices() {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.getIndices');
    try {
      return super.getIndices();
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
numberClientes: ${numberClientes},
numberImoveis: ${numberImoveis}
    ''';
  }
}
