import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/src/providers/db_providers.dart';
import 'package:grupos_estudio_app/widgets/Button_Inicio.dart';
import 'package:grupos_estudio_app/widgets/custom_bottom_navigation.dart';
import 'package:grupos_estudio_app/widgets/custom_design.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    DBProvider.db.database;
    return Scaffold(
      body: Stack(
           children: <Widget>[
             dos(context),
             uno(context),
            Expanded(child:  Column(    
            children: <Widget>[
                appBaner(context),
                Expanded( child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  bnMisGrupos(context),
                  bnPrivado(context),
                  bnNuevo(context),
                  bnExplorar(context),
                  contenedor(context)
                
                      ]
                  )), 
              
            ],)
            )],
         ),
      bottomNavigationBar: CustomNavigationBar(),    
    );
  }
}

 /*class _HomePageBody extends StatelessWidget{
   
  @override
   Widget build(BuildContext context) {
     
   
    
     return Stack(
           children: <Widget>[
             dos(context),
             uno(context),
            Expanded(child:  Column(    
            children: <Widget>[
                appBaner(context),
                Expanded( child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  bnMisGrupos(context),
                  bnPrivado(context),
                  bnNuevo(context),
                  bnExplorar(context),
                  contenedor(context)
                
                      ]
                  )), 
              
            ],)
            )],
         );
   }
}*/

