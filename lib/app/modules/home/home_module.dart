import 'package:vistoria/app/modules/home/dashboard/dashboard_controller.dart';
import 'package:vistoria/app/modules/home/dashboard/repositories/dashboard_repository.dart';
import 'package:vistoria/app/shared/repositories/local_storage_hive.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => DashboardController()),
        Bind((i) => DashboardRepository()),
        Bind((i) => LocalStorageHive())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
