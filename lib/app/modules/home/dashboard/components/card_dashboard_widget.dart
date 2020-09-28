import 'package:flutter/material.dart';

class CardDashboardWidget extends StatelessWidget {
  final IconData iconData;
  final String descricao;
  final int metrica;

  const CardDashboardWidget(
      {Key key,
      @required this.iconData,
      @required this.descricao,
      @required this.metrica})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  iconData,
                  size: 64,
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  metrica.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  descricao,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
