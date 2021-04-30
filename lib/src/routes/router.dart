import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/src/pages/animated_container.dart';
import 'package:grupos_estudio_app/src/pages/grupos.dart';
import 'package:grupos_estudio_app/src/pages/input_page.dart';
import 'package:grupos_estudio_app/src/pages/listview_page.dart';
import 'package:grupos_estudio_app/src/pages/mis_cursos.dart';
import 'package:grupos_estudio_app/src/pages/home_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
    return <String, WidgetBuilder> {
      '/'      : ( BuildContext context ) => HomePage(),
      'misCursos'  : ( BuildContext context ) => MisCursos(),
      'animatedContainer'   : ( BuildContext context ) => AnimatedContainerPage(),
      'list'   : ( BuildContext context ) => ListaPage(),    
      'inputs' : ( BuildContext context ) => InputPage(),    
      'grupos' : (BuildContext contex ) => Grupos(),
            
          };
      }
      
     