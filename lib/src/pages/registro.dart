import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/widgets/custom_design.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[ 
          dos(context), uno(context),

        ],
      ),
    );

  }
}