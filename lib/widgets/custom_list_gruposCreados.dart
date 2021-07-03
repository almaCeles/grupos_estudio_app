import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupos_estudio_app/controladores/grupos.dart';
import 'package:get/get.dart';
import 'package:grupos_estudio_app/model/m_Grupos_Creador.dart';
import 'package:grupos_estudio_app/widgets/custom_bottom_navigation.dart';
import 'package:grupos_estudio_app/widgets/custom_cuadrado_grupos.dart';

class ListGruposCreados extends StatefulWidget {

  @override
  _ListGruposCreadosState createState() => _ListGruposCreadosState();
}

class _ListGruposCreadosState extends State<ListGruposCreados> with SingleTickerProviderStateMixin {

TabController _tabBarOption;
  @override
  void initState() {
    super.initState();
    _tabBarOption = TabController( length: 2, initialIndex: 0, vsync: this);
  }

  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContoladorGrupo>(
      id: 'gruposCreados',
      builder: (_){
        if(_.loading){
            return Center(
              child: LinearProgressIndicator(),
            );
        }
        return Scaffold(
      backgroundColor: Color.fromRGBO(69, 79, 95, 1.0),
      appBar:AppBar(
         title: Text('Grupos' ,style: TextStyle(color: Colors.white , fontSize: 20),),
         backgroundColor:  Color.fromRGBO(69, 79, 95, 1.0),
         flexibleSpace: Row( mainAxisAlignment: MainAxisAlignment.end,),
         bottom: TabBar(
          
          indicatorColor:  Color.fromRGBO(253, 167, 127, 1.0),
          controller: _tabBarOption,
          automaticIndicatorColorAdjustment: false,
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 30.0,
            onPressed: (){}
           )
        ],
      ),
      body: TabBarView(
                  controller: _tabBarOption,
                  children: [
  
          Expanded(
            child: Container(
            decoration: BoxDecoration(
              color: Colors.white ,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)
              ),
            ),
            child: GridView.builder(
              itemCount: _.gruposCreados ==null ? 0 : _.gruposCreados.length,
              itemBuilder:(context, index){
                final GruposCreador grCreado= _.gruposCreados[index];

                print(
                  "grupos: ${{
                    [
                      {
                         grCreado.nombre,
                         grCreado.carrera,
                         grCreado.fechaCreacion
                      }
                    ]
                  }}"
                );
                return 
                mygridIdems(context ,'usuario',grCreado.nombre, "https://sites.google.com/site/precalculoupaep/_/rsrc/1412911484804/otono-2014/derivadas/1.png", Colors.blue[400] , Colors.grey[300]);
              } )
             
          )),
     
       
          Expanded(
            child: Container(
            decoration: BoxDecoration(
              color: Colors.white ,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)
              ),
            ),
            child:_lista(context)
          ))
          
        
                  ],
                ),
     
      bottomNavigationBar: CustomNavigationBar(),
    );
      },
    );
  }
}


Widget _targetas(BuildContext context){
  return GridView.count(
    crossAxisCount:1,
    padding: EdgeInsets.all(16.0),
    childAspectRatio: 3.0,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    children: <Widget>[
       mygridIdems(context ,'animate',"Derivadas", "https://sites.google.com/site/precalculoupaep/_/rsrc/1412911484804/otono-2014/derivadas/1.png", Colors.blue[400] , Colors.grey[300]),
       mygridIdems(
          context,
          'animate',
          "Intgrales",
          "https://sites.google.com/site/precalculoupaep/_/rsrc/1412911484804/otono-2014/derivadas/1.png",
          Colors.green[400],
          Colors.grey[300]),
        mygridIdems(
          context,
          'animate',
          "Java",
          "https://sites.google.com/site/precalculoupaep/_/rsrc/1412911484804/otono-2014/derivadas/1.png",
          Colors.pink[400],
          Colors.grey[300]),

    ],
    );
}

Widget _lista(BuildContext context){
     return GridView.count(
    crossAxisCount:1,
    padding: EdgeInsets.all(16.0),
    childAspectRatio: 3.0,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    children: <Widget>[
       mygridIdems(context ,'usuarios',"Programacion", "https://www.muycomputer.com/wp-content/uploads/2019/01/lenguaje-de-programaci%C3%B3n.jpg", Colors.amber , Colors.grey[300]),
       mygridIdems(context ,'usuarios',"Unity", "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2020/02/unity-logo-1879391.png", Colors.red , Colors.grey[300]),
       mygridIdems(context ,'usuarios',"Programacion", "https://www.linuxadictos.com/wp-content/uploads/python-logo-1.jpg.webp", Colors.black , Colors.grey[300]),

    ],
    );
        
     
   }

