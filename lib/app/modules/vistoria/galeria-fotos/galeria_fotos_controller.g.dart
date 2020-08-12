// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'galeria_fotos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GaleriaFotosController on _GaleriaFotosControllerBase, Store {
  final _$listPhotosAtom = Atom(name: '_GaleriaFotosControllerBase.listPhotos');

  @override
  ObservableList<File> get listPhotos {
    _$listPhotosAtom.reportRead();
    return super.listPhotos;
  }

  @override
  set listPhotos(ObservableList<File> value) {
    _$listPhotosAtom.reportWrite(value, super.listPhotos, () {
      super.listPhotos = value;
    });
  }

  @override
  String toString() {
    return '''
listPhotos: ${listPhotos}
    ''';
  }
}
