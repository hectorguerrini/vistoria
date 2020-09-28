import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/shared/auth/repositories/auth_reposiroty_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _repository = Modular.get();

  @observable
  User user;

  _AuthControllerBase() {
    user = _repository.getUser();
  }

  @action
  Future loginWithEmail(String email, String senha) async {
    user = await _repository.loginWithEmailAndPassword(email, senha);
  }
}
