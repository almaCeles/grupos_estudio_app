import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/widgets/custom_bottom_navigation.dart';
import 'package:grupos_estudio_app/src/providers/menu_provider.dart';
import 'package:grupos_estudio_app/src/utils/icono_string_util.dart';

class Grupos extends StatefulWidget {
  Grupos({Key key}) : super(key: key);

  @override
  _GruposState createState() => _GruposState();
}

class _GruposState extends State<Grupos> with SingleTickerProviderStateMixin  {
  
  TabController _tabBarOption;
  @override
  void initState() {
    super.initState();
    _tabBarOption = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
         title: Text('Grupos' ,style: TextStyle(color: Colors.white , fontSize: 20),),
         backgroundColor:  Color.fromRGBO(69, 79, 95, 1.0),
         flexibleSpace: Row( mainAxisAlignment: MainAxisAlignment.end,
    
      ),
       bottom: TabBar(
          
          indicatorColor:  Color.fromRGBO(253, 167, 127, 1.0),
          controller: _tabBarOption,
          tabs: [
            Tab(
                icon: Icon( Icons.people_alt , color: Color.fromRGBO(253, 167, 127, 1.0), size: 20,),
                text: 'Mis Grupos',
                iconMargin:  const EdgeInsets.only()
            ),
            Tab(
              icon: Icon( Icons.group_work , color: Color.fromRGBO(253, 167, 127, 1.0), size: 20,),
              text: 'Grupos Creados ',
               iconMargin:  const EdgeInsets.only()
            ),
          ],
        ),
      ),
      body:TabBarView(
        controller: _tabBarOption,
        children: [
          _lista(),
          _lista(),
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
