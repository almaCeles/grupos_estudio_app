import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NuevoGrupo extends StatefulWidget {
  NuevoGrupo({Key key}) : super(key: key);

  @override
  _NuevoGrupoState createState() => _NuevoGrupoState();
}

class _NuevoGrupoState extends State<NuevoGrupo> {
  var _nombre;
  var _categoria;
  var _cupo;
  List listIdem = [
    "Relajado", "Examenes", "Serio", "Noobs", "Avanzados"
  ];
  var _tipo;
  var _codigo;
  @override
  Widget build(BuildContext context) {
      final _formKey = GlobalKey<FormState>();
    return Container(
       child: Container(
       child: Scaffold(

      body:Stack(
        children: <Widget>[ 
      //dos(context),uno(context),
      SingleChildScrollView(
         child:
          // dos(context),uno(context),
          Column(
        
         children: [
            Form(
              key: _formKey,
              child: 
            Column(
              children: [
                Image.asset(
                      "assets/triangulo.png",
                    
                      width: 500,
                      height: 125
                  
                    ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: TextEditingController(text: _nombre),
                    onChanged: (value) {
                      _nombre = value;
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
                        hintText: 'Ingresa Nombre',
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
                  child: TextField(
                    controller: TextEditingController(text: _categoria),
                    onChanged: (value) {
                      _categoria = value;
                    },
                    
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.tab,
                          color: Colors.blue,
                        ),
                        hintText: 'Tematica',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                       ),
                  ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: _cupo),
                      onChanged: (value) {
                        _cupo = value;
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
                          hintText: '¿cuantos integrantes pueden estar?',
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
                    child: 
                    TextButton(
                          child: Text('Guardar'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                             backgroundColor: Colors.teal,
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          ),
                          onPressed: ()  {
                            if (_formKey.currentState.validate()) {
                               nuevoGrupo();
                           Navigator.pushNamed(context, 'home');
                          } else {
                            print("not ok");
                          }
                               
                          }
                        )
                    
                  ),
                ),

              ],

            )
            ),
           ]

           ),
       )])
    
    )
       )
    );
  }

  Future nuevoGrupo() async {
    var url = Uri.http("127.0.0.1:5000", "/api/v1/new-group");
    print(url);
    Map<String, String> body = {
      "nombreGrupo": _nombre,
      "creador": "alma",
      "carrera": "Ing Sistemas",
      "categoria":_categoria ,
      "cupo": _cupo
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
      } else {
        print("Response status : ${res.body}");
      }
      //}

    } else {
      print("solicitud con exito");
    }
  }
}



/*class NuevoGrupo extends StatefulWidget {
  NuevoGrupo({Key key}) : super(key: key);

  @override
  _NuevoGrupoState createState() => _NuevoGrupoState();
}

class _NuevoGrupoState extends State<NuevoGrupo> {
  var _nombre;
  var _tematica;
  var _etiquetaGrupo;
  List listIdem = [
    "Relajado", "Examenes", "Serio", "Noobs", "Avanzados"
  ];
  var _tipo;
  var _codigo;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Container(
       child: Scaffold(

      body:Stack(
        children: <Widget>[ 
      //dos(context),uno(context),
      SingleChildScrollView(
         child:
          // dos(context),uno(context),
          Column(
        
         children: [
            Form(
              key: _formKey,
              child: 
            Column(
              children: [
                Image.asset(
                      "assets/triangulo.png",
                    
                      width: 500,
                      height: 125
                  
                    ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: TextEditingController(text: _nombre),
                    onChanged: (value) {
                      _nombre = value;
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
                        hintText: 'Ingresa Nombre',
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
                  child: TextField(
                    controller: TextEditingController(text: _tematica),
                    onChanged: (value) {
                      _tematica = value;
                    },
                    
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.tab,
                          color: Colors.blue,
                        ),
                        hintText: 'Escribe...',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                       ),
                  ),
                    ),
                    Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButton(
                    hint: Text('selecciona etiqueta: '),
                    value: _etiquetaGrupo,
                    onChanged: (newValue){
                      setState(() {
                        _etiquetaGrupo= newValue;
                      });
                    },
                    items: listIdem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem)
                        );
                    }).toList()
                    )
                    ),
                    
                    Padding(
                      padding: EdgeInsets.all(50),
                      child: DropdownButton(
                    hint: Text('selecciona etiqueta: '),
                    value: _etiquetaGrupo,
                    onChanged: (newValue){
                      setState(() {
                        _etiquetaGrupo= newValue;
                      });
                    },
                    items: listIdem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem)
                        );
                    })
                    )
                    ),
                  
                  Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    height: 50,
                    width: 400,
                    child: 
                    TextButton(
                          child: Text('Guardar'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                             backgroundColor: Colors.teal,
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          ),
                          onPressed: ()  {
                            if (_formKey.currentState.validate()) {
                           
                           Navigator.pushNamed(context, 'grupo');
                          } else {
                            print("not ok");
                          }
                               
                          }
                        )
                    
                  ),
                ),

              ],

            )
            ),
           ]

           ),
       )])
    
    )
    );
  }
}*/