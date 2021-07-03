import 'dart:ffi';
import 'package:get/get.dart';
import 'package:grupos_estudio_app/model/m_Grupos_Creador.dart';
import 'package:grupos_estudio_app/services/grupos.dart';

class ContoladorGrupo  extends GetxController{

  bool _loading= true;
  bool get loading => _loading;
 
   List<GruposCreador> _gruposCreados = [];
   List<GruposCreador> get gruposCreados => _gruposCreados;

   Map<String,GruposCreador> _listaGrupos = Map();
   Map<String, GruposCreador> get listaGrupos => _listaGrupos;

   @override
   void onInit(){
     super.onInit();
     print("estado iniciado");
   }

   @override
   void onReady(){
     super.onReady;
   }

   Future<Void> loadGruposCreados() async{
      
      final data =await gruposServices.instanse.getGruposCreados();
      this._gruposCreados = data;
      this._loading= false;

      update(['gruposCreados']);
   }



   


}