import 'pdf_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'pdf_page.dart';

class PdfModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PdfController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PdfPage()),
      ];

  static Inject get to => Inject<PdfModule>.of();
}
