// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'galeria_fotos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GaleriaFotosController on _GaleriaFotosControllerBase, Store {
  final _$itensAtom = Atom(name: '_GaleriaFotosControllerBase.itens');

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

  final _$listaAtom = Atom(name: '_GaleriaFotosControllerBase.lista');

  @override
  ObservableList<dynamic> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(ObservableList<dynamic> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$deleteImageAsyncAction =
      AsyncAction('_GaleriaFotosControllerBase.deleteImage');

  @override
  Future deleteImage(dynamic item) {
    return _$deleteImageAsyncAction.run(() => super.deleteImage(item));
  }

  final _$willPopAsyncAction =
      AsyncAction('_GaleriaFotosControllerBase.willPop');

  @override
  Future<bool> willPop() {
    return _$willPopAsyncAction.run(() => super.willPop());
  }

  @override
  String toString() {
    return '''
itens: ${itens},
lista: ${lista}
    ''';
  }
}
