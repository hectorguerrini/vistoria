import 'package:vistoria/app/modules/cadastro/cadastro_module.dart';
import 'package:vistoria/app/modules/configuracao/configuracao_module.dart';
import 'package:vistoria/app/modules/login/login_module.dart';
import 'package:vistoria/app/modules/pdf/pdf_module.dart';
import 'package:vistoria/app/modules/vistoria/vistoria_module.dart';
import 'package:vistoria/app/shared/auth/auth_controller.dart';
import 'package:vistoria/app/shared/auth/repositories/auth_reposiroty_interface.dart';
import 'package:vistoria/app/shared/auth/repositories/auth_repository.dart';
import 'package:vistoria/app/shared/splash/splash_controller.dart';
import 'package:vistoria/app/shared/splash/splash_screen.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:vistoria/app/app_widget.dart';
import 'package:vistoria/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => SplashController())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashScreen()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/cadastro', module: CadastroModule()),
        ModularRouter('/vistoria', module: VistoriaModule()),
        ModularRouter('/pdf', module: PdfModule()),
        ModularRouter('/configuracao', module: ConfiguracaoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
