import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/widgets/custom_design.dart';
import 'package:image_picker/image_picker.dart';

class NuevaTarjetaTema extends StatefulWidget {

  @override
  _NuevaTarjetaTemaState createState() => _NuevaTarjetaTemaState();
}

class _NuevaTarjetaTemaState extends State<NuevaTarjetaTema> {
  var _nombre;
  var _fecha;
  var _link;
  var _foto;
  var _text;
  @override
  Widget build(BuildContext context) {
    String imagePath;
    
    final _formKey = GlobalKey<FormState>();
    return Scaffold(

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
                    controller: TextEditingController(text: _text),
                    onChanged: (value) {
                      _text = value;
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
                  child: TextFormField(
                    controller: TextEditingController(text: _link),
                    onChanged: (value) {
                      _link = value;
                    },
                    
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.tab,
                          color: Colors.blue,
                        ),
                        hintText: 'Ingresa link de youtube',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                       ),
                  ),
                    ),
                    
                    Column(
                      children: [
                        Text('Seleccione imagen : '),
                        
                        (imagePath == null ) ? Container() : Image.file(File(imagePath)),
                        
                        TextButton(
                          child: Text('Carga imagen'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                             backgroundColor: Colors.teal,
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          ),
                          onPressed: () async {
                            final ImagePicker _picker = ImagePicker();
                            PickedFile _pickedFile = await _picker.getImage(source: ImageSource.gallery);
                              // imagePath = _pickedFile.path;
                              this.setState(() {
                                 imagePath = _pickedFile.path;
                               });
                               
                               print(imagePath);
                               _pickedFile.readAsBytes().then((value){

                               });
                               
                          }
                        )
                      ],
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
    
    );
  }
}
