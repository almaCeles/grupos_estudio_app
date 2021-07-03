import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/widgets/custom_bottom_navigation.dart';
import 'package:grupos_estudio_app/widgets/custom_design.dart';
import 'package:http/http.dart' as http;

class UnirmeAgrupo extends StatefulWidget {

  @override
  _UnirmeAgrupoState createState() => _UnirmeAgrupoState();
}

class _UnirmeAgrupoState extends State<UnirmeAgrupo> {
  @override
  var _codigo;
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
     return Scaffold(
       body:      Stack(
           children: <Widget>[
           dos(context),
             uno(context),
            
             Form(
                key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                      "assets/triangulo.png",
                    
                      width: 500,
                      height: 125
                  
                    ),
                     Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: TextEditingController(text: _codigo),
                    onChanged: (value) {
                      _codigo = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Esta Vacio';
                      }
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.tab,
                          color: Colors.blue,
                        ),
                        hintText: 'Ingresa Codigo grupo',
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
                padding: EdgeInsets.all(30),
                child: Container(
                    height: 50,
                    width: 400,
                    child: TextButton(
                        child: Text('Guardar'),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                          shape: const BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            
                            nuevoGrupo();
                          } else {
                            print("not ok");
                          }
                        })),
              ),

                    
                ],
              )
             )


            ]
           ),
        bottomNavigationBar: CustomNavigationBar(), 
       
     );
     
 
          
  }
   Future nuevoGrupo() async {
    var url = Uri.http("127.0.0.1:5000", "/api/v1/add-companion");
    print(url);
    Map<String, String> body = {
      "codigoG": _codigo,
       "usuario": "alma"
    };
    print(body);
    Map<String, String> headers = {
      "Context-Type": "application/json;charSet=UTF-8"
    };
    print(headers);
    var jsonResponse;

    var res = await http.post(url, headers: headers, body: body);

    print(res.statusCode);

    if (res.statusCode == 200) {
      print("Dentro de 208");
      jsonResponse = json.decode(res.body);
      print(jsonResponse);

      print("Response status: ${res.statusCode}");
      print("Response status: ${res.body}");

      if (jsonResponse != null) {
        Navigator.pushNamed(context, '');
      } else {
        print("Response status : ${res.body}");
      }
      //}

    } else {
      print("solicitud sin exito");
    }
  }
}

