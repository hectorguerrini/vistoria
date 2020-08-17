import 'package:flutter/material.dart';

class CardMenuWidget extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final IconData icon;

  const CardMenuWidget(
      {Key key, this.onTap, @required this.title, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          color: Colors.green[700],
          child: Center(
            child: ListTile(
              onTap: onTap,
              title: Icon(
                icon,
                color: Colors.white,
                size: 72,
              ),
              subtitle: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          )),
    );
  }
}
