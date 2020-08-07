import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/shared/auth/auth_controller.dart';

import 'models/login_model.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthController _authController = Modular.get();

  @observable
  LoginModel loginModel;

  _LoginControllerBase() {
    loginModel = new LoginModel(email: '', senha: '');
  }

  @action
  setEmail(String value) => loginModel = loginModel.copyWith(email: value);
  @action
  setSenha(String value) => loginModel = loginModel.copyWith(senha: value);

  @action
  login() async {
    try {
      _authController.loginWithEmail(loginModel.email, loginModel.senha);
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      print(e.message);
    }
  }

  @computed
  bool get isValid =>
      loginModel.email.isNotEmpty &&
      loginModel.senha.isNotEmpty &&
      loginModel.senha.length >= 6;
}
