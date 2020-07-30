import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String action;

  const ConfirmationDialog({Key key, this.action}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirmação'),
      content: Text.rich(
          TextSpan(text: 'Deseja continuar com esta ação de ', children: [
        TextSpan(
            text: '$action', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '?')
      ])),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop(false);
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
