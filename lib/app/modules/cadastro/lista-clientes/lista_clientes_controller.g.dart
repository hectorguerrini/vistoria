// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_clientes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaClientesController on _ListaClientesControllerBase, Store {
  final _$listClientesAtom =
      Atom(name: '_ListaClientesControllerBase.listClientes');

  @override
  ObservableStream<List<ClienteModel>> get listClientes {
    _$listClientesAtom.reportRead();
    return super.listClientes;
  }

  @override
  set listClientes(ObservableStream<List<ClienteModel>> value) {
    _$listClientesAtom.reportWrite(value, super.listClientes, () {
      super.listClientes = value;
    });
  }

  final _$listClientesFilteredAtom =
      Atom(name: '_ListaClientesControllerBase.listClientesFiltered');

  @override
  ObservableFuture<List<ClienteModel>> get listClientesFiltered {
    _$listClientesFilteredAtom.reportRead();
    return super.listClientesFiltered;
  }

  @override
  set listClientesFiltered(ObservableFuture<List<ClienteModel>> value) {
    _$listClientesFilteredAtom.reportWrite(value, super.listClientesFiltered,
        () {
      super.listClientesFiltered = value;
    });
  }

  final _$searchBarAtom = Atom(name: '_ListaClientesControllerBase.searchBar');

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

  final _$selecionarClienteAsyncAction =
      AsyncAction('_ListaClientesControllerBase.selecionarCliente');

  @override
  Future selecionarCliente(ClienteModel clienteModel) {
    return _$selecionarClienteAsyncAction
        .run(() => super.selecionarCliente(clienteModel));
  }

  final _$editarClienteAsyncAction =
      AsyncAction('_ListaClientesControllerBase.editarCliente');

  @override
  Future editarCliente(ClienteModel clienteModel) {
    return _$editarClienteAsyncAction
        .run(() => super.editarCliente(clienteModel));
  }

  final _$_ListaClientesControllerBaseActionController =
      ActionController(name: '_ListaClientesControllerBase');

  @override
  dynamic getListaSearch(String value) {
    final _$actionInfo = _$_ListaClientesControllerBaseActionController
        .startAction(name: '_ListaClientesControllerBase.getListaSearch');
    try {
      return super.getListaSearch(value);
    } finally {
      _$_ListaClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getListaClientes() {
    final _$actionInfo = _$_ListaClientesControllerBaseActionController
        .startAction(name: '_ListaClientesControllerBase.getListaClientes');
    try {
      return super.getListaClientes();
    } finally {
      _$_ListaClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listClientes: ${listClientes},
listClientesFiltered: ${listClientesFiltered},
searchBar: ${searchBar}
    ''';
  }
}
