import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/cadastro/repositories/cadastro_imovel_repository.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/shared/components/confirmation_dialog.dart';
part 'lista_imoveis_controller.g.dart';

class ListaImoveisController = _ListaImoveisControllerBase
    with _$ListaImoveisController;

abstract class _ListaImoveisControllerBase with Store {
  final CadastroImovelRepository _repository;

  @observable
  ObservableFuture<List<ImovelModel>> listImoveis;

  _ListaImoveisControllerBase(this._repository) {
    getListaImoveis();
  }

  @action
  getListaImoveis() async {
    listImoveis = _repository.getListImoveis().asObservable();
  }

  @action
  selecionarImovel(ImovelModel imovelModel) async {
    var confimacao = await Modular.to.showDialog(
        builder: (context) => ConfirmationDialog(
              action: 'Selecionar Imovel',
            ));
    if (confimacao) {
      Modular.to.pop(imovelModel);
    }
  }
}
