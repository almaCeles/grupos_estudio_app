
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:grupos_estudio_app/model/modeloSala.dart';
import 'package:grupos_estudio_app/src/pages/Salas.dart';
import 'package:grupos_estudio_app/src/pages/contenidoSala.dart';
import 'package:grupos_estudio_app/widgets/TarjetaBoton.dart';
import '../screens/ContactosGrupo.dart';

class PrincipalGrupo extends StatefulWidget {
  PrincipalGrupo({Key key, this.modeloSalaUsuarios, this.miUsuario})
      : super(key: key);
  final List<modeloSala> modeloSalaUsuarios;
  final modeloSala miUsuario;
  @override
  _PrincipalGrupo createState() => _PrincipalGrupo();
}

class _PrincipalGrupo extends State<PrincipalGrupo>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(69, 79, 95, 1.0),
      body: 
      ListView(
        children: [
          Container(
             height: 250,
             //padding: EdgeInsets.only(top: 10),
             child:Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    IconButton( icon: Icon(Icons.keyboard_backspace_sharp, color: Colors.yellow[700] ,size: 30), onPressed: () { Navigator.pop(context,'grupos');}),
                    IconButton(icon: Icon(Icons.settings, color: Colors.yellow[700] ,size: 20), onPressed: () {})
                 ],),
                   Image.asset(
                      "assets/triangulo.png",
                    
                      width: 500,
                      height: 125
                  
                    ),

                 Text('Nombre Grupo',
                        style: TextStyle(
                          color: Color(0xFFFDA77F),
                          fontFamily: 'Quicksand',
                          fontSize: 25,
                          fontWeight: FontWeight.w900

                        ),
                  
                 ),
                
                TabBar(
                  controller: _controller,
                  indicator: BoxDecoration(  color: Color.fromRGBO(69, 79, 95, 1.0) ),
                    tabs: [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                              Icon(Icons.messenger, color:  Color(0xFFFDA77F) ,size: 23)
                          ],
                        )
                        
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.library_books_rounded, color:  Color(0xFFFDA77F) ,size: 23)
                        ],
                        )
                      )
                       
                    ],
                )
               ],
             ) ,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white
            
            ),
            child: TabBarView(
                  controller: _controller,
                  children: [
                    Salas(miUsuario: widget.miUsuario),
                    Salas(miUsuario: widget.miUsuario)
                   ],
           ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, 'tarjeta');
            },
            child: Icon(Icons.add),
            backgroundColor: Color.fromRGBO(69, 79, 95, 1.0),
      ),
    );
  }
}