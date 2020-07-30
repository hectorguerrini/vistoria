import 'package:vistoria/app/modules/cadastro/cadastro-cliente/cadastro_cliente_controller.dart';
import 'package:vistoria/app/modules/cadastro/cadastro-cliente/cadastro_cliente_page.dart';
import 'package:vistoria/app/modules/cadastro/cadastro-endereco/cadastro_endereco_controller.dart';
import 'package:vistoria/app/modules/cadastro/cadastro-endereco/cadastro_endereco_page.dart';
import 'package:vistoria/app/modules/cadastro/cadastro-imovel/cadastro_imovel_controller.dart';
import 'package:vistoria/app/modules/cadastro/cadastro-imovel/cadastro_imovel_page.dart';
import 'package:vistoria/app/modules/cadastro/lista-clientes/lista_clientes_controller.dart';
import 'package:vistoria/app/modules/cadastro/lista-clientes/lista_clientes_page.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_cliente_repository.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_endereco_repository.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_imovel_repository.dart';
import 'package:vistoria/app/shared/repositories/local_storage_hive.dart';

import 'cadastro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'cadastro_page.dart';

class CadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CadastroController()),
        Bind((i) =>
            CadastroClienteController(i.get<CadastroClienteRepository>())),
        Bind((i) => CadastroClienteRepository(i.get<LocalStorageHive>())),
        Bind(
            (i) => CadastroImovelController(i.get<CadastroImovelRepository>())),
        Bind((i) => CadastroImovelRepository(i.get<LocalStorageHive>())),
        Bind(
            (i) => ListaClientesController(i.get<CadastroClienteRepository>())),
        Bind((i) =>
            CadastroEnderecoController(i.get<CadastroEnderecoRepository>())),
        Bind((i) => CadastroEnderecoRepository(i.get<Dio>())),
        Bind((i) => Dio()),
        Bind((i) => LocalStorageHive())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CadastroPage()),
        Router('/cliente', child: (_, args) => CadastroClientePage()),
        Router('/imovel', child: (_, args) => CadastroImovelPage()),
        Router('/endereco', child: (_, args) => CadastroEnderecoPage()),
        Router('/lista_cliente',
            child: (_, args) => ListaClientesPage(
                  modoSelecao: args.data,
                )),
      ];

  static Inject get to => Inject<CadastroModule>.of();
}
