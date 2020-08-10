// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_imoveis_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaImoveisController on _ListaImoveisControllerBase, Store {
  final _$listImoveisAtom =
      Atom(name: '_ListaImoveisControllerBase.listImoveis');

  @override
  ObservableFuture<List<ImovelModel>> get listImoveis {
    _$listImoveisAtom.reportRead();
    return super.listImoveis;
  }

  @override
  set listImoveis(ObservableFuture<List<ImovelModel>> value) {
    _$listImoveisAtom.reportWrite(value, super.listImoveis, () {
      super.listImoveis = value;
    });
  }

  final _$getListaImoveisAsyncAction =
      AsyncAction('_ListaImoveisControllerBase.getListaImoveis');

  @override
  Future getListaImoveis() {
    return _$getListaImoveisAsyncAction.run(() => super.getListaImoveis());
  }

  final _$selecionarImovelAsyncAction =
      AsyncAction('_ListaImoveisControllerBase.selecionarImovel');

  @override
  Future selecionarImovel(ImovelModel imovelModel) {
    return _$selecionarImovelAsyncAction
        .run(() => super.selecionarImovel(imovelModel));
  }

  @override
  String toString() {
    return '''
listImoveis: ${listImoveis}
    ''';
  }
}
