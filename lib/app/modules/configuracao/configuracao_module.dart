import 'repositories/configuracao_repository.dart';
import 'configuracao_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'configuracao_page.dart';

class ConfiguracaoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConfiguracaoRepository()),
        Bind((i) => ConfiguracaoController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ConfiguracaoPage()),
      ];

  static Inject get to => Inject<ConfiguracaoModule>.of();
}
