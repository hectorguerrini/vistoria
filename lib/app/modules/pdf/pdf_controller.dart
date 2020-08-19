import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';

part 'pdf_controller.g.dart';

class PdfController = _PdfControllerBase with _$PdfController;

abstract class _PdfControllerBase with Store {
  @observable
  VistoriaModel vistoriaModel;

  _PdfControllerBase() {
    vistoriaModel = Modular.args.data;
  }

  @action
  Future<Uint8List> generatePdf(PdfPageFormat format) async {
    final pw.Document doc = pw.Document();
    const imageProvider = const AssetImage('assets/logo.png');
    final PdfImage image = await pdfImageFromImageProvider(
        pdf: doc.document, image: imageProvider);
    doc.addPage(pw.MultiPage(
      header: (context) => pw.Container(
          child: pw.Row(children: [pw.Image(image, width: 150)]),
          padding: pw.EdgeInsets.only(bottom: 20),
          decoration: const pw.BoxDecoration(
              border: pw.BoxBorder(
                  bottom: true, width: 0.5, color: PdfColors.grey))),
      build: (context) => [
        pw.Container(
            alignment: pw.Alignment.center,
            padding: pw.EdgeInsets.symmetric(vertical: 10),
            child: pw.Text('Relatorio de Vistoria',
                style: pw.TextStyle(fontSize: 16)))
      ],
    ));
    return doc.save();
  }
}
