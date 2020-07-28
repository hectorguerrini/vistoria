import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  final String mensagem;
  const MessageDialog({Key key, this.mensagem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Mensagem'),
      content: Text('$mensagem.'),
    );
  }
}
