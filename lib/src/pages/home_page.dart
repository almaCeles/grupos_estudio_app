import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/widgets/custom_appBar.dart';
import 'package:grupos_estudio_app/widgets/custom_bottom_navigation.dart';


class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: PreferredSize(
          child: ClipPath(
            clipper: CustomAppBar(),
          child: Container(color: Color.fromRGBO(69, 79, 95, 1.0),
            child: Column( 
            children: <Widget>[
              SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya.jpg'),
                        radius: 25.0,
                        backgroundColor: Colors.yellow[400],
                      ),
                    ),
                   Text('Nombre Apeido ' , style: TextStyle(color: Colors.red[300], fontSize: 30),)
                    
                        ],
                      ) 
              ),
               MaterialButton(
                        minWidth: 150.0,
                        height: 28.0,
                        onPressed: () {},
                        color: Color.fromRGBO(253, 167, 127, 1.0),
                        hoverColor: Colors.green,    
                        child: Text('perfil', style: TextStyle(color: Colors.white)
                  ),)
              
            ],),),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 100)),
      body: 
      Stack(
      alignment: Alignment.bottomRight,
       children: <Widget>[
         
         Row(  mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SafeArea(
                child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[
              
           MaterialButton(
                  
                  minWidth: 200.0,
                  height: 60.0,
                  onPressed: () {Navigator.pushNamed(context, 'grupos');},
                  color: Color.fromRGBO(91, 114, 152, 1.0),
                  child: Row( children: <Widget>[ 
                    
                    Icon( Icons.people_alt , color: Color.fromRGBO(253, 167, 127, 1.0), size: 30,),
                    Text('Mis Grupos', style: TextStyle(color: Colors.white,fontSize: 20), ), 
                  ]),
                  
           ),
            MaterialButton(
                  minWidth: 250.0,
                  height: 80.0,
                  onPressed: () {},
                  color: Color.fromRGBO(91, 114, 152, 1.0),
                  child: Row( mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[ 
                    Icon( Icons.lock_rounded , color: Color.fromRGBO(253, 167, 127, 1.0), size: 40,),
                    Column(
                       children: <Widget>[ 
                      Text('Privado', style: TextStyle(color: Colors.white,fontSize: 25)),
                      Text('Buscar por clave', style: TextStyle(color: Colors.white),)])
                  
                  ]),
           ),
            MaterialButton(
                  minWidth: 300.0,
                  height: 100.0,
                  onPressed: () {},
                  color: Color.fromRGBO(91, 114, 152, 1.0),
                  child: Row( mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[ 
                    Icon( Icons.person_add , color: Color.fromRGBO(253, 167, 127, 1.0), size: 50,),
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[ 
                      Text('Nuevo', style: TextStyle(color: Colors.white, fontSize: 25) ),
                      Text('Crear un nuevo grupo de estudio', style: TextStyle(color: Colors.white),),])
                  
                  ]),
                  
           ),
            MaterialButton(
                   
                  minWidth: 350.0,
                  height: 100.0,
                  onPressed: () {},
                  color: Color.fromRGBO(91, 114, 152, 1.0),
                  child: Row( children: <Widget>[ 
                    Icon( Icons.explore , color: Color.fromRGBO(253, 167, 127, 1.0), size: 70,),
                    Column( children: <Widget>[ 
                      Text('Explorar', style: TextStyle(color: Colors.white, fontSize: 30),  ),
                      Text('Unete a los nuevos grupos', style: TextStyle(color: Colors.white)),])
                  
                  ]),
           ),
            Container(
        
              margin: EdgeInsets.all(24),
              color: Color.fromRGBO(69, 79, 95, 1.0),
              alignment: Alignment.center,
              width: 380,
              height: 120.0,
              padding: EdgeInsets.all(16),
              child: Row( mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[ Text('Notificaciones',style: TextStyle(color: Color.fromRGBO(253, 167, 127, 1.0))),],
              )
           )
            ]
          ),
          
         )])
          
 
      ],
       ),
       bottomNavigationBar: CustomNavigationBar(),
       );
       
  }

  
}



