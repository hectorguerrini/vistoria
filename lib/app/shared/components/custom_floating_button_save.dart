import 'package:flutter/material.dart';
import 'package:vistoria/app/shared/components/message_dialog.dart';

class CustomFloatingButtonSave extends StatelessWidget {
  final Function f;

  const CustomFloatingButtonSave({Key key, this.f}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await f();
      },
      child: Icon(Icons.save),
    );
  }
}
