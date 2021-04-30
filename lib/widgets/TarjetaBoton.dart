import 'package:flutter/material.dart';

class TarjetaBoton extends StatelessWidget {
  const TarjetaBoton({Key key, this.name, this.icon}) : super(key: key);
  final String name;
  final IconData icon;

  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 23,
          child: Icon(
            icon,
            size: 26,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFFFDA77F),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ));
  }
}
