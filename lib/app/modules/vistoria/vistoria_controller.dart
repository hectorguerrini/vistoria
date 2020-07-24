import 'package:mobx/mobx.dart';

part 'vistoria_controller.g.dart';

class VistoriaController = _VistoriaControllerBase with _$VistoriaController;

abstract class _VistoriaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
