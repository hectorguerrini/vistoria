import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:vistoria/app/enumeration/ambientes_enum.dart';
import 'package:vistoria/app/enumeration/estado_itens_enum.dart';
import 'package:vistoria/app/enumeration/itens_ambiente_enum.dart';
import 'package:vistoria/app/enumeration/tipo_vistoria_enum.dart';
import 'package:vistoria/app/enumeration/tipo_imovel_enum.dart';
import 'package:vistoria/app/modules/pdf/repositories/pdf_repository.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_ambiente_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';
import 'package:vistoria/app/shared/auth/auth_controller.dart';

part 'pdf_controller.g.dart';

class PdfController = _PdfControllerBase with _$PdfController;

abstract class _PdfControllerBase with Store {
  final AuthController _authController = Modular.get();
  final PdfRepository _repository = Modular.get();
  @observable
  VistoriaModel vistoriaModel;

  Map<String, dynamic> fotos = new Map();

  _PdfControllerBase() {
    vistoriaModel = Modular.args.data;
  }

  @action
  Future getFotos() async {
    await Future.wait(vistoriaModel.listAmbientes.map((amb) async {
      await Future.wait(amb.listItens.map((item) async {
        item.photoUrl.asMap().forEach((index, e) async {
          fotos[amb.ambiente.toShortString()] =
              fotos[amb.ambiente.toShortString()] ?? new Map();
          fotos[amb.ambiente.toShortString()][item.item.toShortString()] =
              fotos[amb.ambiente.toShortString()][item.item.toShortString()] ??
                  new Map();
          fotos[amb.ambiente.toShortString()][item.item.toShortString()]
              [index] = (await _repository.getImage(e));
        });
      }));
    }));
  }

  @action
  Future<Uint8List> generatePdf(PdfPageFormat format) async {
    const imageProvider = const AssetImage('assets/logo.png');
    await getFotos();
    var myTheme = pw.ThemeData.withFont(
      base: pw.Font.ttf(await rootBundle.load("assets/OpenSans-Regular.ttf")),
      bold: pw.Font.ttf(await rootBundle.load("assets/OpenSans-Bold.ttf")),
      italic: pw.Font.ttf(await rootBundle.load("assets/OpenSans-Italic.ttf")),
      boldItalic:
          pw.Font.ttf(await rootBundle.load("assets/OpenSans-BoldItalic.ttf")),
    );
    final pw.Document doc = pw.Document(theme: myTheme);
    final PdfImage image = await pdfImageFromImageProvider(
        pdf: doc.document, image: imageProvider);
    doc.addPage(pw.MultiPage(
      header: (context) => pw.Container(
          child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Image(image, width: 150),
                pw.Container(
                    alignment: pw.Alignment.topRight,
                    child: pw.Column(children: [
                      pw.Text('Green Consultoria Imobiliária'),
                      pw.Text('CNPJ: 23.575.300/00001-02'),
                    ]))
              ]),
          padding: pw.EdgeInsets.only(bottom: 20),
          decoration: const pw.BoxDecoration(
              border: pw.BoxBorder(
                  bottom: true, width: 0.5, color: PdfColors.grey))),
      build: (context) => [
        pw.Container(
            alignment: pw.Alignment.center,
            child: pw.Text('Relatorio de Vistoria',
                style: pw.TextStyle(fontSize: 16))),
        pw.Container(
            alignment: pw.Alignment.center,
            child: pw.Text('20/08/2020', style: pw.TextStyle(fontSize: 16))),
        pw.RichText(
            text: pw.TextSpan(children: [
          pw.TextSpan(
              text: 'Tipo: ',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.TextSpan(text: vistoriaModel.tipoVistoria.toShortString()),
        ])),
        pw.RichText(
            text: pw.TextSpan(children: [
          pw.TextSpan(
              text: 'Vistoriador: ',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.TextSpan(text: _authController.user.displayName),
        ])),
        pw.Divider(),
        pw.RichText(
            text: pw.TextSpan(children: [
          pw.TextSpan(
              text: 'Imovél: ',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.TextSpan(
              text: vistoriaModel.imovelModel.tipoImovel.toShortString()),
        ])),
        pw.RichText(
            text: pw.TextSpan(children: [
          pw.TextSpan(
              text: 'Endereço: ',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.TextSpan(text: vistoriaModel.imovelModel.enderecoModel.logradouro),
          pw.TextSpan(
              text: ' Nº' + vistoriaModel.imovelModel.enderecoModel.numero),
          pw.TextSpan(
              text: ', ' +
                  vistoriaModel.imovelModel.enderecoModel.complemento +
                  '\n'),
          pw.TextSpan(
              text: vistoriaModel.imovelModel.enderecoModel.bairro + ', '),
          pw.TextSpan(
              text: vistoriaModel.imovelModel.enderecoModel.cidade + ' - '),
          pw.TextSpan(text: vistoriaModel.imovelModel.enderecoModel.uf),
          pw.TextSpan(
              text: ', CEP: ' + vistoriaModel.imovelModel.enderecoModel.cep),
        ])),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.RichText(
              text: pw.TextSpan(children: [
            pw.TextSpan(
                text: 'Proprietário: ',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.TextSpan(
                text: vistoriaModel.imovelModel.proprietario.nomeCompleto),
          ])),
          pw.Text(' CPF: ' + vistoriaModel.imovelModel.proprietario.cpf),
        ]),
        pw.Divider(),
        pw.Text('Locatarios: ',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        ...vistoriaModel.locatarios
            .map((e) => pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(e.nomeCompleto),
                      pw.Text('CPF: ' + e.cpf),
                    ]))
            .toList(),
        pw.Divider(),
        pw.Header(level: 0, text: 'Ambientes'),
        ...vistoriaModel.listAmbientes.map((amb) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Header(
                    level: 3,
                    text: amb.ambiente.toShortString() + ' - ' + amb.descricao),
                pw.Paragraph(text: '- ' + amb.observacao),
                ...amb.listItens.map((e) {
                  var c = 0;
                  return pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Bullet(
                            text: e.item.toShortString() +
                                ' - ' +
                                e.estadoItens.toShortString()),
                        pw.Paragraph(text: e.observacao ?? ''),
                        ...e.photoUrl.map((uri) {
                          var _image = fotos[amb.ambiente.toShortString()]
                              [e.item.toShortString()][c];
                          c += 1;
                          print(_image);
                          return pw.Image(PdfImage(doc.document,
                              image: _image, width: 100, height: 100));
                        }).toList()
                      ]);
                })
              ]);
        }).toList()
      ],
    ));
    return doc.save();
  }
}
