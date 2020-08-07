import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vistoria/app/shared/auth/auth_controller.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final AuthController _authController = Modular.get();

  _init() async {
    if (_authController.user != null) {
      Modular.to.pushReplacementNamed('/home');
    } else {
      Modular.to.pushReplacementNamed('/login');
    }
  }

  _SplashControllerBase() {
    Future.delayed(Duration(seconds: 2)).then((value) => _init());
  }
}
