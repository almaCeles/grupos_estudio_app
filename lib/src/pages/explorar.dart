import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/widgets/custom_bottom_navigation.dart';
import 'package:grupos_estudio_app/widgets/custom_cuadrado_grupos.dart';
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
               
                mygridIdems(context,'usuario',"Derivadas", "https://sites.google.com/site/precalculoupaep/_/rsrc/1412911484804/otono-2014/derivadas/1.png", Colors.blue[400] , Colors.grey[300]),
              
            ],)
            )],
         ) ,
         bottomNavigationBar: CustomNavigationBar(),    
    );
  }
}