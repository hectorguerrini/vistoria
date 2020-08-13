import 'package:flutter/material.dart';

class ConfirmationSavedDialog extends StatelessWidget {
  const ConfirmationSavedDialog({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirmação'),
      content: Text('Se sair sem salvar os dados serão perdidos.'),
      actions: <Widget>[
        FlatButton(
          child: Text('Sair'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        FlatButton(
          child: Text('Salvar e Sair'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
