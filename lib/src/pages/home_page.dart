import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/src/utils/icono_string_util.dart';
import 'package:grupos_estudio_app/widgets/custom_bottom_navigation.dart';
import 'package:grupos_estudio_app/widgets/custom_design.dart';
import 'package:grupos_estudio_app/src/providers/menu_provider.dart';

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
         ),Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya.jpg'),
              radius: 25.0,
              backgroundColor: Colors.yellow[400],
            ),
          ),
        /*  MaterialButton(
                  minWidth: 200.0,
                  height: 40.0,
                  onPressed: () {},
                  color: Colors.lightBlue,
                  child: Text('Mis Grupos', style: TextStyle(color: Colors.white)),
                  
        )*/
         _lista()

      ],
       ),
       bottomNavigationBar: CustomNavigationBar(),
       );
       
  }

  
}

Widget _lista(){
     //print( menuProvider.opciones);
     return FutureBuilder(
       future: menuProvider.cargarData(),
       initialData: [],
       builder: (context, AsyncSnapshot<List<dynamic>> snapshot  ){
           
         
          return ListView(
            children: _listaItems(snapshot.data, context),
          );
       },
     );
        
     
   }
List<Widget> _listaItems(List<dynamic> data , BuildContext context ) {
     final List<Widget> opciones =[];

     data.forEach((opt) { 
       final widgetTemp =ListTile(
         title: Text(opt[ 'texto']),
         leading: getIcon(opt['icon']),
         trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
         onTap: (){
           /*final route= MaterialPageRoute(
             builder: (context)=> AlertPage(),
           );
           Navigator.push(context, route);*/
           Navigator.pushNamed(context, opt['ruta']);
         },
       );

       opciones..add(widgetTemp)
               ..add(Divider());
     });

     return opciones;
  }



