import 'package:flutter/services.dart';
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
      await _authController.loginWithEmail(loginModel.email, loginModel.senha);
      Modular.to.pushReplacementNamed('/home');
    } on PlatformException catch (e) {
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
          print("Seu email está invalido. (exemplo@email.com)");
          break;
        case "ERROR_WRONG_PASSWORD":
          print("Sua senha está incorreta. Tente novamente");
          break;
        case "ERROR_USER_NOT_FOUND":
          print(
              "Email não cadastrado. Insira um email cadastrado ou se registre.");
          break;
        default:
          print("Erro de conexão.");
          break;
      }
    }
  }

  @computed
  bool get isValid =>
      loginModel.email.isNotEmpty &&
      loginModel.senha.isNotEmpty &&
      loginModel.senha.length >= 6;
}
