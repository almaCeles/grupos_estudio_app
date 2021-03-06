

import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/model/m_Grupos_Creador.dart';
import 'package:grupos_estudio_app/services/grupos.dart';
import 'package:grupos_estudio_app/widgets/custom_bottom_navigation.dart';
import 'package:grupos_estudio_app/src/providers/menu_provider.dart';
import 'package:grupos_estudio_app/src/utils/icono_string_util.dart';
import 'package:grupos_estudio_app/widgets/custom_cuadrado_grupos.dart';

class Grupos extends StatefulWidget {
  Grupos({Key key}) : super(key: key);

  @override
  _GruposState createState() => _GruposState();
}

class _GruposState extends State<Grupos> with SingleTickerProviderStateMixin  {


  List<GruposCreador> _gruposCreados = [];
  
  void arre()async{
    final data = await gruposServices.instanse.getGruposCreados();
    this._gruposCreados = data;
  }

  TabController _tabBarOption;
  @override
  void initState() {
 
    super.initState();
    _tabBarOption = TabController(vsync: this, length: 2, initialIndex: 0);
    arre();
  }

  @override
  Widget build(BuildContext context) {
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
            child: _targetas(context)
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
  }
  Widget _targetas(BuildContext context) {
    print("dentro de metodo targetas");
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      
           itemCount: _gruposCreados.length,
           itemBuilder: (BuildContext c, int index){
                print("list bulder");
                if(_gruposCreados.length > 0){
             print("que paso?");
          print(_gruposCreados[index].creador);
          return mygridIdems(
              c,
              'usuarios',
              _gruposCreados[index].nombre,
              "https://www.muycomputer.com/wp-content/uploads/2019/01/lenguaje-de-programaci%C3%B3n.jpg",
              Colors.amber,
              Colors.grey[300]);    
                }else{
                  print("vacio no has creado grupos");
                }
           
                  

              
            
             
           },

        );
  }
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

/*Widget _lista(){
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
           Navigator.pushNamed(context, opt['ruta']);
         },
       );

       opciones..add(widgetTemp)
               ..add(Divider());
     });

     return opciones;
  }*/
