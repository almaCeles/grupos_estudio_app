import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/widgets/custom_bottom_navigation.dart';
import 'package:grupos_estudio_app/widgets/custom_design.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      
       body: Stack(
      children: <Widget>[
         Design().build(context),
         Design().dos(context),
         Container(
              width:  5,
              height: 5,
              color: Colors.pink,
         )

      ],
      
       ),
       bottomNavigationBar: CustomNavigationBar(),
       );
       
  }

  
}



