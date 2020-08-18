import 'package:vistoria/app/modules/cadastro/repositories/cadastro_cliente_repository.dart';
import 'package:vistoria/app/modules/vistoria/lista-vistorias/lista_vistorias_controller.dart';
import 'package:vistoria/app/modules/vistoria/galeria-fotos/galeria_fotos_controller.dart';
import 'package:vistoria/app/modules/vistoria/galeria-fotos/galeria_fotos_page.dart';
import 'package:vistoria/app/modules/vistoria/repositories/vistoria_repository.dart';
import 'package:vistoria/app/shared/repositories/local_storage_hive.dart';

import 'cadastro-vistoria/cadastro_vistoria_module.dart';
import 'lista-vistorias/lista_vistorias_module.dart';
import 'lista-vistorias/lista_vistorias_page.dart';
import 'vistoria_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'vistoria_page.dart';

class VistoriaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => VistoriaController()),
        Bind((i) => VistoriaRepository(i.get<LocalStorageHive>())),
        Bind((i) => GaleriaFotosController()),
        Bind((i) => CadastroClienteRepository(i.get<LocalStorageHive>())),
        Bind((i) => LocalStorageHive()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => VistoriaPage()),
        Router('/cadastro', module: CadastroVistoriaModule()),
        Router('/galeria', child: (_, args) => GaleriaFotosPage()),
        Router('/lista', module: ListaVistoriasModule()),
      ];

  static Inject get to => Inject<VistoriaModule>.of();
}
