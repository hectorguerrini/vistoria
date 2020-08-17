// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_vistorias_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaVistoriasController on _ListaVistoriasControllerBase, Store {
  final _$listVistoriaAtom =
      Atom(name: '_ListaVistoriasControllerBase.listVistoria');

  @override
  ObservableFuture<List<VistoriaModel>> get listVistoria {
    _$listVistoriaAtom.reportRead();
    return super.listVistoria;
  }

  @override
  set listVistoria(ObservableFuture<List<VistoriaModel>> value) {
    _$listVistoriaAtom.reportWrite(value, super.listVistoria, () {
      super.listVistoria = value;
    });
  }

  final _$selectVistoriaAsyncAction =
      AsyncAction('_ListaVistoriasControllerBase.selectVistoria');

  @override
  Future selectVistoria(VistoriaModel vistoriaModel) {
    return _$selectVistoriaAsyncAction
        .run(() => super.selectVistoria(vistoriaModel));
  }

  final _$_ListaVistoriasControllerBaseActionController =
      ActionController(name: '_ListaVistoriasControllerBase');

  @override
  dynamic getListaVistoria() {
    final _$actionInfo = _$_ListaVistoriasControllerBaseActionController
        .startAction(name: '_ListaVistoriasControllerBase.getListaVistoria');
    try {
      return super.getListaVistoria();
    } finally {
      _$_ListaVistoriasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listVistoria: ${listVistoria}
    ''';
  }
}
