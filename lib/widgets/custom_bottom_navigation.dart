import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
     // showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.yellow[700],
      backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      currentIndex: 1, 
      
      items: [
        BottomNavigationBarItem(

          icon: Icon(Icons.home),
          label: 'Home' 
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Cursos' 
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help),
          label: 'Ayuda' 
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.adjust),
          label: 'Configuraciones' 
        ),
      ],
    );
  }
}