import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/widgets/custom_design.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
    var  _email;
    var  _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body:Stack(
        children: <Widget>[
             dos(context),
             uno(context),
Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
            
              controller: _email,
         

            ),
            SizedBox( height: 25,),
            TextField(
              controller: _password,
         
            ),
            SizedBox( height: 50,),
            TextButton(
              child: Text('Ingresar'),
              onPressed: (){Navigator.pushNamed(context, 'home');
              },
            ),

            SizedBox( height: 50,),
            InkWell(
              child: Text("¿Primera vez?, CREA UNA CUENTA", textAlign: TextAlign.center,),
              onTap: (){
                Navigator.pushNamed(context, 'registrar');
              },
            )


          ],
        ),
      ),
        ],
      ),
      
       
    );
  }
}