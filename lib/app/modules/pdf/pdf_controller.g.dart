// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PdfController on _PdfControllerBase, Store {
  final _$vistoriaModelAtom = Atom(name: '_PdfControllerBase.vistoriaModel');

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

  final _$generatePdfAsyncAction =
      AsyncAction('_PdfControllerBase.generatePdf');

  @override
  Future<Uint8List> generatePdf(PdfPageFormat format) {
    return _$generatePdfAsyncAction.run(() => super.generatePdf(format));
  }

  @override
  String toString() {
    return '''
vistoriaModel: ${vistoriaModel}
    ''';
  }
}
