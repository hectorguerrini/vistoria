import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/logo.png'),
                  width: size.width * 0.50,
                ),
                TextField(
                  onChanged: controller.setEmail,
                  decoration: InputDecoration(labelText: 'Usuario'),
                ),
                TextFormField(
                  onChanged: controller.setSenha,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                  validator: (val) =>
                      val.trim().isEmpty ? 'Insira sua senha' : null,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Observer(builder: (_) {
                    return RaisedButton(
                      onPressed: controller.isValid ? controller.login : null,
                      padding: EdgeInsets.all(0.0),
                      textColor: Colors.blue,
                      color: Colors.white,
                      child: Text('Entrar'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.blue)),
                    );
                  }),
                )
              ],
            ),
          ),
        ));
  }
}
