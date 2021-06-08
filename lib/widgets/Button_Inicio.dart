import 'package:flutter/material.dart';

Widget bnMisGrupos(BuildContext context){
  return MaterialButton(
                  
                  minWidth: 50.0,
                  height: 50.0,
                  onPressed: () {Navigator.pushNamed(context, 'grupos');},
                  color: Color.fromRGBO(91, 114, 152, 1.0),
                  child: Row(  mainAxisSize: MainAxisSize.min, 
                    children: <Widget>[ 
                    Icon( Icons.people_alt , color: Color.fromRGBO(253, 167, 127, 1.0), size: 30,),
                    Text('Mis Grupos', style: TextStyle(color: Colors.white,fontSize: 20), ), 
                  ]),
                  
           );
}

Widget bnPrivado(BuildContext context){
  return  MaterialButton(
                  minWidth: 215.0,
                  height: 60.0,
                  onPressed: () {},
                  color: Color.fromRGBO(91, 114, 152, 1.0),
                  child: Row( mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                    children: <Widget>[ 
                    Icon( Icons.lock_rounded , color: Color.fromRGBO(253, 167, 127, 1.0), size: 40,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[ 
                      Text('Privado', style: TextStyle(color: Colors.white,fontSize: 20)),
                      Text('Buscar por clave', style: TextStyle(color: Colors.white),)])
                  
                  ]),
           );

}

Widget bnNuevo(BuildContext context){
  return MaterialButton(
                  minWidth: 150.0,
                  height: 70.0,
                  onPressed: () {Navigator.pushNamed(context, 'nuevoGrupo');},
                  color: Color.fromRGBO(91, 114, 152, 1.0),
                  child: Row( mainAxisAlignment: MainAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                    children: <Widget>[ 
                    Icon( Icons.person_add , color: Color.fromRGBO(253, 167, 127, 1.0), size: 50,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[ 
                      Text('Nuevo', style: TextStyle(color: Colors.white, fontSize: 25) ),
                      Text('Crear un nuevo grupo de estudio', style: TextStyle(color: Colors.white),),])
                  
                  ]),
                  
           );
}

Widget bnExplorar(BuildContext context){
  return MaterialButton(
     
                  minWidth: 300.0,
                  height: 80.0,
                  onPressed: () { Navigator.pushNamed(context, 'explorar');},
                  color: Color.fromRGBO(91, 114, 152, 1.0),
                  child: Row( 
                    
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[ 
                    Icon( Icons.explore , color: Color.fromRGBO(253, 167, 127, 1.0), size: 60,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                       children: <Widget>[ 
                      Text('Explorar', style: TextStyle(color: Colors.white, fontSize: 25),  ),
                      Text('Unete a los nuevos grupos', style: TextStyle(color: Colors.white)),])
                  
                  ]),
           );
}

Widget bnBaner(BuildContext context){
   return TextButton(
     onPressed: (){}, 
     child: Text('Perfil',),
     style:  TextButton.styleFrom( 
             textStyle: TextStyle(
                color: Colors.red[300],
                fontStyle: FontStyle.normal
             ),
             shape: RoundedRectangleBorder( 
               borderRadius: BorderRadius.circular(18.0),
               side: BorderSide(color: Colors.red[300]),
             ),
             minimumSize: Size.zero
    ),
   );
}

Widget contenedor(BuildContext context){
  return   Container(
              color: Color.fromRGBO(69, 79, 95, 1.0),
              alignment: Alignment.center,
              width: 350,
              height: 90.0,
              padding: EdgeInsets.all(16),
              child: Row( mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[ Text('Notificaciones',style: TextStyle(color: Color.fromRGBO(253, 167, 127, 1.0))),],
              )
           );
}