import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/widgets/Button_Inicio.dart';
import 'package:grupos_estudio_app/widgets/custom_bottom_navigation.dart';
import 'package:grupos_estudio_app/widgets/custom_design.dart';

class Explorar extends StatefulWidget {
  Explorar({Key key}) : super(key: key);

  @override
  _ExplorarState createState() => _ExplorarState();
}

class _ExplorarState extends State<Explorar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
           children: <Widget>[
             dos(context),
             uno(context),
            Expanded(child:  Column(    
            children: <Widget>[
               
                
              
            ],)
            )],
         ) ,
         bottomNavigationBar: CustomNavigationBar(),    
    );
  }
}