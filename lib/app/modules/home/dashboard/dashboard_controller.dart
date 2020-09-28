import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/modules/home/dashboard/repositories/dashboard_repository.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final DashboardRepository _repository = Modular.get();

  @observable
  ObservableStream<int> numberClientes;
  @observable
  ObservableStream<int> numberImoveis;
  _DashboardControllerBase() {
    getIndices();
  }
  @action
  getIndices() {
    numberClientes = _repository.getNumberClientes().asObservable();
    numberImoveis = _repository.getNumberImoveis().asObservable();
  }
}
