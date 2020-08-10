import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/shared/auth/auth_controller.dart';
import 'package:oktoast/oktoast.dart';
import 'models/login_model.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthController _authController = Modular.get();

  String msg;

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
          msg = "Seu email está invalido. (exemplo@email.com)";
          print(msg);
          break;
        case "ERROR_WRONG_PASSWORD":
          msg = "Sua senha está incorreta. Tente novamente";
          print(msg);
          break;
        case "ERROR_USER_NOT_FOUND":
          msg =
              "Email não cadastrado. Insira um email cadastrado ou se registre.";
          print(msg);
          break;
        default:
          msg = "Erro de conexão.";
          print(msg);
          break;
      }
      showToast(msg,
          backgroundColor: Colors.red,
          textStyle: TextStyle(color: Colors.white));
    }
  }

  @computed
  bool get isValid =>
      loginModel.email.isNotEmpty &&
      loginModel.senha.isNotEmpty &&
      loginModel.senha.length >= 6;
}
