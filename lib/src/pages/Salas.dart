import 'dart:async';
import '../../model/Post.dart';
import '../fetch/fetchPost.dart';
import '../../widgets/componenteAsync.dart';
import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/model/modeloSala.dart';
import 'package:grupos_estudio_app/widgets/TarjetaTema.dart';

class Salas extends StatefulWidget {
  Salas({Key key, this.miUsuario}) : super(key: key);
  final modeloSala miUsuario;

  @override
  _SalasState createState() => _SalasState();
}

class _SalasState extends State<Salas> {
  void initState() {
    super.initState();
    // getThemes();
  }

  // Future<Post> getThemes() async {
  //   print("-----> si se ejecuto");
  // }

  List<modeloSala> salas = [
    modeloSala(
        id: 1, name: "General", icon: "topico.svg", date: "12-Abril-2020"),
    modeloSala(
        id: 2,
        name: "Conceptos Basicos",
        icon: "topico.svg",
        date: "02-Octubre-2020"),
    modeloSala(
        id: 3, name: "Arreglos", icon: "topico.svg", date: "29-Noviembre-2020"),
    modeloSala(
        id: 4,
        name: "Estructura de datos",
        icon: "topico.svg",
        date: "26-Enero-2021"),
    modeloSala(
        id: 5, name: "Arboles", icon: "topico.svg", date: "12-Abril-2021"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body:
          //FetchPost(post: fetchPost()),
          ListView.builder(
        itemCount: salas.length,
        itemBuilder: (context, index) => TarjetaTema(
          modeloS: salas[index],
          miUsuario: widget.miUsuario,
        ),
      ),
    );
  }
}
