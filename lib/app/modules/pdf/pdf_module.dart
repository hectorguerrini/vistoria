import 'package:vistoria/app/modules/pdf/repositories/pdf_repository.dart';

import 'pdf_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pdf_page.dart';

class PdfModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PdfController()),
        Bind((i) => PdfRepository()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => PdfPage()),
      ];

  static Inject get to => Inject<PdfModule>.of();
}
