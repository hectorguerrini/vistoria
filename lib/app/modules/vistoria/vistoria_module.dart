import 'package:vistoria/app/modules/cadastro/repositories/cadastro_cliente_repository.dart';
import 'package:vistoria/app/modules/vistoria/itens-ambiente/itens_ambiente_controller.dart';
import 'package:vistoria/app/modules/vistoria/itens-ambiente/itens_ambiente_page.dart';
import 'package:vistoria/app/modules/vistoria/lista-vistorias/lista_vistorias_controller.dart';
import 'package:vistoria/app/modules/vistoria/nova-vistoria/nova_vistoria_controller.dart';
import 'package:vistoria/app/modules/vistoria/nova-vistoria/nova_vistoria_page.dart';
import 'package:vistoria/app/modules/vistoria/galeria-fotos/galeria_fotos_controller.dart';
import 'package:vistoria/app/modules/vistoria/galeria-fotos/galeria_fotos_page.dart';
import 'package:vistoria/app/modules/vistoria/repositories/nova_vistoria_repository.dart';
import 'package:vistoria/app/shared/repositories/local_storage_hive.dart';

import 'lista-vistorias/lista_vistorias_page.dart';
import 'vistoria_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'vistoria_page.dart';

class VistoriaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => VistoriaController()),
        Bind((i) => NovaVistoriaController(i.get<NovaVistoriaRepository>())),
        Bind((i) => NovaVistoriaRepository(i.get<LocalStorageHive>())),
        Bind((i) => ItensAmbienteController()),
        Bind((i) => GaleriaFotosController()),
        Bind((i) => ListaVistoriasController(i.get<NovaVistoriaRepository>())),
        Bind((i) => CadastroClienteRepository(i.get<LocalStorageHive>())),
        Bind((i) => LocalStorageHive()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => VistoriaPage()),
        Router('/nova_vistoria', child: (_, args) => NovaVistoriaPage()),
        Router('/itens_ambiente', child: (_, args) => ItensAmbientePage()),
        Router('/galeria', child: (_, args) => GaleriaFotosPage()),
        Router('/lista_vistorias', child: (_, args) => ListaVistoriasPage()),
      ];

  static Inject get to => Inject<VistoriaModule>.of();
}
