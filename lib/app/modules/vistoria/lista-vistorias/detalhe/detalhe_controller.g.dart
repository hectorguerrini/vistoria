// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhe_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalheController on _DetalheControllerBase, Store {
  final _$vistoriaModelAtom =
      Atom(name: '_DetalheControllerBase.vistoriaModel');

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

  final _$_DetalheControllerBaseActionController =
      ActionController(name: '_DetalheControllerBase');

  @override
  dynamic verFotos(VistoriaAmbienteModel item) {
    final _$actionInfo = _$_DetalheControllerBaseActionController.startAction(
        name: '_DetalheControllerBase.verFotos');
    try {
      return super.verFotos(item);
    } finally {
      _$_DetalheControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
vistoriaModel: ${vistoriaModel}
    ''';
  }
}
