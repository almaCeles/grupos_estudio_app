import 'dart:convert';
//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grupos_estudio_app/model/m_usuario.dart';
import 'package:grupos_estudio_app/preferenciasUsuario/p_usuario.dart';
import 'package:grupos_estudio_app/src/providers/decodificar_token.dart';
//import 'package:grupos_estudio_app/widgets/custom_design.dart';
import 'package:http/http.dart' as http;
import  'package:shared_preferences/shared_preferences.dart';
import 'package:grupos_estudio_app/model/user.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
    bool _isLoading = false;
    final _formKey = GlobalKey<FormState>();
    final _prefs = new  PreferenciasUsuario();
    MUsuario usuaro;
  User user = User('', '');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          
          //dos(context),uno(context),
          SingleChildScrollView(     
          child:Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 140,
                ),
                Text(
                  "Grupos-Tec",
                  style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.blue),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: TextEditingController(text: user.email),
                    onChanged: (value) {
                      user.email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Esta Vacio";
                      }
                       /*else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return null;
                      } else {
                        return 'Email Invalido';
                      }*/
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        hintText: 'Ingresa Email',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: TextEditingController(text: user.password),
                    onChanged: (value) {
                      user.password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Esta vacio';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.blue,
                        ),
                        hintText: 'Ingresa Password',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                  child: Container(
                    height: 50,
                    width: 400,
                    child: FlatButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print("me precionaste");
                             signIn();
                
                           
                          } else {
                            print("not ok");
                          }
                         // Navigator.pushNamed(context, 'home');
                        },
                        child: Text(
                          "Ir",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(95, 20, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          "No tienes cuenta ? ",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                           Navigator.pushNamed(context, 'registrar');
                          },
                          child: Text(
                            "Registrarse",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                       ],
                    ),
                )
              ]
            )
          )
          ))
        ]
      )
    );
  }

 Future signIn( ) async {
     var url=  Uri.http("127.0.0.1:5000", "/api/v1/get-user");
     print(url);
     SharedPreferences  sharedPreferences = await SharedPreferences.getInstance();
     Map<String, String>  body ={"usuario": user.email , "clave": user.password};
     print(body);
     Map<String, String>  headers= { "Context-Type": "application/json;charSet=UTF-8"};
     print(headers);
     var jsonResponse;
     
       var res = await  http.post(url ,  headers: headers, body: body );
     
    print(res.statusCode );

     if(res.statusCode == 200 ){ 
        print("Dentro de 208");
       jsonResponse = json.decode(res.body);
       print(jsonResponse);

       print("Response status: ${res.statusCode}");
       print("Response status: ${res.body}");

       if (jsonResponse != null){
         setState(() {
           _isLoading =true;
         });
         _prefs.token=jsonResponse['accessToken'];
        // sharedPreferences.setString("token", jsonResponse['accessToken']);
         print(decofificar(_prefs.token)['nombre']);
       // print("soy el decodificado" + decofificar(_prefs.token));
         //MUsuario.fromJson(decofificar(_prefs.token));

         
         Navigator.pushNamed(context, 'home');
       }else{
          setState(() {
            _isLoading = false;
          });
          print("Response status : ${res.body}");
       }
     //}
     
  }else{
    print("solicitud con exito");
  }

}
}
