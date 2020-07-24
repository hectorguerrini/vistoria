import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String action;

  const ConfirmationDialog({Key key, this.action}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirmação'),
      content: Text('Deseja continuar com esta ação de $action?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Continuar'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
