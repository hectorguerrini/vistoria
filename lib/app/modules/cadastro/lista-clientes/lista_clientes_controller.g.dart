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
  ObservableFuture<List<ClienteModel>> get listClientes {
    _$listClientesAtom.reportRead();
    return super.listClientes;
  }

  @override
  set listClientes(ObservableFuture<List<ClienteModel>> value) {
    _$listClientesAtom.reportWrite(value, super.listClientes, () {
      super.listClientes = value;
    });
  }

  final _$selecionarClienteAsyncAction =
      AsyncAction('_ListaClientesControllerBase.selecionarCliente');

  @override
  Future selecionarCliente(ClienteModel clienteModel) {
    return _$selecionarClienteAsyncAction
        .run(() => super.selecionarCliente(clienteModel));
  }

  final _$_ListaClientesControllerBaseActionController =
      ActionController(name: '_ListaClientesControllerBase');

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
listClientes: ${listClientes}
    ''';
  }
}
