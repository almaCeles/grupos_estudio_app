//import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';


Widget mygridIdems(BuildContext context,String pagina, String name, String img, Color color1, Color color2){
 return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
          gradient: new LinearGradient(
            colors: [
             color1,
             color2
            ],
            begin: Alignment.centerLeft,
            end: new Alignment(1.0, 1.0),
           ),  
      ),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                image:DecorationImage(
                  image: new NetworkImage( img ),
                  fit:  BoxFit.fill,
                  ),
              ),
            )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container( child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Container(child:Text("Grupo", style: TextStyle(color: Colors.grey[700], fontSize: 16),) ),
                SizedBox(width: 10.0),
                Container(child: Icon(Icons.ad_units_outlined), color: Colors.white,),
                SizedBox(width: 10.0),  
                Container(child:Text("Estudio", style: TextStyle(color:Colors.grey[700], fontSize: 16),)),
                ],
                )),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextButton(
                    child: Text(name, style: TextStyle(color: Colors.grey[800] ,fontSize: 20, fontWeight: FontWeight.bold),),
                    onPressed: (){  Navigator.pushNamed( context , pagina); } ,
                     )
                  //Text(name, style: TextStyle(color: Colors.grey[800] ,fontSize: 20, fontWeight: FontWeight.bold),)
                  )
              ],
            )
        ],
      ),
    );
}

