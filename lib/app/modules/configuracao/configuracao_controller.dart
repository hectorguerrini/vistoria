import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vistoria/app/shared/auth/auth_controller.dart';
import 'package:vistoria/app/modules/configuracao/repositories/configuracao_repository.dart';
import 'package:vistoria/app/shared/components/message_dialog.dart';
part 'configuracao_controller.g.dart';

class ConfiguracaoController = _ConfiguracaoControllerBase
    with _$ConfiguracaoController;

abstract class _ConfiguracaoControllerBase with Store {
  final ConfiguracaoRepository _configuracaoRepository = Modular.get();
  final AuthController _authController = Modular.get();
  // @observable
  // CorretorModel corretorModel;
  @observable
  String nomeCompleto;

  _ConfiguracaoControllerBase() {
    nomeCompleto = _authController.user.displayName;
  }

  @action
  setNome(String value) => nomeCompleto = value;

  @computed
  bool get isValid => nomeCompleto != '' && nomeCompleto != null;

  @action
  save() {
    try {
      if (isValid) _configuracaoRepository.saveName(nomeCompleto);
      Modular.to
          .showDialog(
              builder: (context) => MessageDialog(
                    mensagem: 'Nome Atualizado',
                  ))
          .then((value) => Modular.to.pop());
    } catch (e) {
      print(e);
    }
  }
}
