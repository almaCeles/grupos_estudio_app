import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/preferenciasUsuario/p_usuario.dart';
import 'package:grupos_estudio_app/src/pages/home_page.dart';
import 'package:grupos_estudio_app/src/routes/router.dart';
//este es un comentario XD

void main() async {
  final prefs= new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final _pre = new PreferenciasUsuario();
    print(_pre.token);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: HomePage(),
        initialRoute: '/',
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          print('Ruta llamda: ${settings.name}');

          return MaterialPageRoute(
              builder: (BuildContext context) => HomePage());
        });
  }
}
