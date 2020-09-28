import 'package:flutter_modular/flutter_modular.dart';

import 'package:vistoria/app/modules/vistoria/repositories/vistoria_repository.dart';

import 'itens-ambiente/itens_ambiente_controller.dart';
import 'itens-ambiente/itens_ambiente_page.dart';
import 'nova-vistoria/nova_vistoria_controller.dart';
import 'nova-vistoria/nova_vistoria_page.dart';

class CadastroVistoriaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NovaVistoriaController(i.get<VistoriaRepository>())),
        Bind((i) => ItensAmbienteController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => NovaVistoriaPage()),
        ModularRouter('/itens_ambiente',
            child: (_, args) => ItensAmbientePage()),
      ];

  static Inject get to => Inject<CadastroVistoriaModule>.of();
}
