import 'package:flutter_modular/flutter_modular.dart';

import 'detalhe/detalhe_controller.dart';
import 'detalhe/detalhe_page.dart';
import 'lista_vistorias_controller.dart';
import 'lista_vistorias_page.dart';
import 'repositories/lista_vistorias_repository.dart';

class ListaVistoriasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
            (i) => ListaVistoriasController(i.get<ListaVistoriasRepository>())),
        Bind((i) => ListaVistoriasRepository()),
        Bind((i) => DetalheController())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ListaVistoriasPage()),
        ModularRouter('/detalhe', child: (_, args) => DetalhePage()),
      ];

  static Inject get to => Inject<ListaVistoriasModule>.of();
}
