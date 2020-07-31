import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/cadastro/models/imovel_model.dart';
import 'package:vistoria/app/modules/vistoria/models/vistoria_model.dart';
part 'nova_vistoria_controller.g.dart';

class NovaVistoriaController = _NovaVistoriaControllerBase
    with _$NovaVistoriaController;

abstract class _NovaVistoriaControllerBase with Store {
  int currentStep = 0;
  @observable
  VistoriaModel vistoriaModel;

  @action
  next() {
    goTo(currentStep + 1);
  }

  @action
  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  @action
  goTo(int step) {
    currentStep = step;
  }

  @action
  setImovelModel(ImovelModel value) =>
      vistoriaModel = vistoriaModel.copyWith(imovelModel: value);

  @computed
  ImovelModel get getImovelModel => vistoriaModel.imovelModel;
}
