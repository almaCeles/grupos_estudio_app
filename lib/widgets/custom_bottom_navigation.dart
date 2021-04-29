import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //showSelectedLabels: false,
      showUnselectedLabels: true,
      selectedItemColor: Colors.yellow[700],
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.black,
      currentIndex: 0, 
      
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,  size: 30,),
          label: 'Home' ,
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book, size: 30,),
          label: 'Cursos' 
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help, size: 30,),
          label: 'Ayuda' 
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 30,),
          label: 'Ajustes' 
        ),
      ],
      
    );
  }
}