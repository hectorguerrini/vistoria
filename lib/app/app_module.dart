import 'package:vistoria/app/modules/cadastro/cadastro_module.dart';
import 'package:vistoria/app/modules/vistoria/vistoria_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:vistoria/app/app_widget.dart';
import 'package:vistoria/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/cadastro', module: CadastroModule()),
        Router('/vistoria', module: VistoriaModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
