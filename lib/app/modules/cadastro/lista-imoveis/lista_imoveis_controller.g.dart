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
  ObservableStream<List<ImovelModel>> get listImoveis {
    _$listImoveisAtom.reportRead();
    return super.listImoveis;
  }

  @override
  set listImoveis(ObservableStream<List<ImovelModel>> value) {
    _$listImoveisAtom.reportWrite(value, super.listImoveis, () {
      super.listImoveis = value;
    });
  }

  final _$listImoveisFilteredAtom =
      Atom(name: '_ListaImoveisControllerBase.listImoveisFiltered');

  @override
  ObservableFuture<List<ImovelModel>> get listImoveisFiltered {
    _$listImoveisFilteredAtom.reportRead();
    return super.listImoveisFiltered;
  }

  @override
  set listImoveisFiltered(ObservableFuture<List<ImovelModel>> value) {
    _$listImoveisFilteredAtom.reportWrite(value, super.listImoveisFiltered, () {
      super.listImoveisFiltered = value;
    });
  }

  final _$searchBarAtom = Atom(name: '_ListaImoveisControllerBase.searchBar');

  @override
  String get searchBar {
    _$searchBarAtom.reportRead();
    return super.searchBar;
  }

  @override
  set searchBar(String value) {
    _$searchBarAtom.reportWrite(value, super.searchBar, () {
      super.searchBar = value;
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

  final _$editarImovelAsyncAction =
      AsyncAction('_ListaImoveisControllerBase.editarImovel');

  @override
  Future editarImovel(ImovelModel imovelModel) {
    return _$editarImovelAsyncAction.run(() => super.editarImovel(imovelModel));
  }

  final _$_ListaImoveisControllerBaseActionController =
      ActionController(name: '_ListaImoveisControllerBase');

  @override
  dynamic getListaSearch(String value) {
    final _$actionInfo = _$_ListaImoveisControllerBaseActionController
        .startAction(name: '_ListaImoveisControllerBase.getListaSearch');
    try {
      return super.getListaSearch(value);
    } finally {
      _$_ListaImoveisControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listImoveis: ${listImoveis},
listImoveisFiltered: ${listImoveisFiltered},
searchBar: ${searchBar}
    ''';
  }
}
