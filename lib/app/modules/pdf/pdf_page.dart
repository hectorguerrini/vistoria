import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:printing/printing.dart';
import 'pdf_controller.dart';

class PdfPage extends StatefulWidget {
  final String title;
  const PdfPage({Key key, this.title = "Pdf"}) : super(key: key);

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends ModularState<PdfPage, PdfController> {
  //use 'controller' variable to access controller
  PrintingInfo printingInfo;
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    printingInfo = await Printing.info();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PdfPreview(build: controller.generatePdf),
    );
  }
}
