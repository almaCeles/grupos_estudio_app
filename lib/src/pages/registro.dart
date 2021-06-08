import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/model/userDatos.dart';
import 'package:grupos_estudio_app/widgets/custom_design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import  'package:shared_preferences/shared_preferences.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {

  UserDatos _userDatos = UserDatos("", "", "", "", "", "", "", "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[ 
          dos(context), uno(context),
            ListView(
               children: [
                 
                 Container(
                    alignment: Alignment.center,
                    child: Form(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        "Registrase",
                        style: GoogleFonts.pacifico(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.blue),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: TextEditingController(text: _userDatos.usuario),
                            onChanged: (value) {
                              _userDatos.usuario = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Esta Vacio';
                              } 
                            },
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.umbrella,
                                  color: Colors.blue,
                                ),
                                hintText: 'Ingresa Usuario',
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
                            controller: TextEditingController(text: _userDatos.nombre),
                            onChanged: (value) {
                              _userDatos.nombre= value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Esta Vacio';
                              } 
                            },
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                hintText: 'Ingresa  Nombre',
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
                            controller: TextEditingController(text: _userDatos.apellidop),
                            onChanged: (value) {
                              _userDatos.apellidop= value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Esta Vacio';
                              } 
                            },
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                hintText: 'Ingresa  Apellido Paterno',
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
                            controller: TextEditingController(text: _userDatos.apellidom),
                            onChanged: (value) {
                              _userDatos.apellidom= value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Esta Vacio';
                              } 
                            },
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                hintText: 'Ingresa  Apellido Materno',
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
                            controller: TextEditingController(text: _userDatos.carrera),
                            onChanged: (value) {
                              _userDatos.carrera= value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Esta Vacio';
                              } 
                            },
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                hintText: 'Ingresa  Carrera',
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
                            controller: TextEditingController(text: _userDatos.clave),
                            onChanged: (value) {
                              _userDatos.clave = value;
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
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: TextEditingController(text: _userDatos.repetirClave),
                            onChanged: (value) {
                              _userDatos.repetirClave = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Esta vacio';
                              
                              }else if(_userDatos.clave != _userDatos.repetirClave){
                                   return 'No coninciden Pasword';
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
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: TextEditingController(text: _userDatos.email),
                            onChanged: (value) {
                              _userDatos.email = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Esta Vacio';
                              } else if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return null;
                              } else {
                                return 'Email Invalido';
                              }
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
                      padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                      child: Container(
                        height: 50,
                        width: 400,
                        child: FlatButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            onPressed: () {
                                 
                                 registro();
                                 Navigator.pushNamed(context, '/');
                            },
                            child: Text(
                              "Registrar",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                ),
                    ],
                  )
                  )
                 )
               ]
            )
        ],
      ),
    );

  }
 registro( ) async {
     var url = Uri.http("127.0.0.1:5000", "/api/v1/add-user");
    //print(url);
     
    // SharedPreferences  sharedPreferences = await SharedPreferences.getInstance();
      Map<String, String>   headers= { "Context-Type": "application/json;charSet=UTF-8"};
     Map<String, String>   body ={
       "usuario": _userDatos.usuario,
       "nombre": _userDatos.nombre,
       "apellido_p": _userDatos.apellidop,
       "apellido_m": _userDatos.apellidom,
       "carrera": _userDatos.carrera,
       "clave": _userDatos.clave,
       "repetirClave": _userDatos.repetirClave,
       "email": _userDatos.email,
        };
        print(body);
     var jsonResponse;
      
     var res = await  http.post(url ,  headers: headers, body: body );
     if(res.statusCode == 200 ){ 
       jsonResponse = json.decode(res.body);

       print("Response status: ${res.statusCode}");
       print("Response status: ${res.body}");

       if (jsonResponse != null){
         
         Navigator.pushNamed(context, '/');
       }else{
          print("Response status : ${res.body}");
       }
     }else{
       print("error de status");
     }
     
  }
  
}