import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/widgets/TarjetaBoton.dart';
import '../screens/PrincipalGrupo.dart';
import '../model/modeloSala.dart';


class PantallaLoginTemp extends StatefulWidget {
  PantallaLoginTemp({Key key}) : super(key: key);

  @override
  _PantallaLoginTemp createState() => _PantallaLoginTemp();
}

class _PantallaLoginTemp extends State<PantallaLoginTemp> {
  modeloSala recursoChat;
  List<modeloSala> modeloSesion = [
    modeloSala(
      name: "La Alma",
      icon: "person.svg",
      date: "12-Abril-2020",
      status: "Una persona muy desidiosa",
      id: 1,
    ),
    modeloSala(
        name: "Axer",
        icon: "person.sgv",
        date: "02-Octubre-2020",
        status: "Me debe 10 pesos",
        id: 2),
    modeloSala(
        name: "Victor",
        icon: "person.svg",
        date: "29-Noviembre-2020",
        status: "Es un compañero responsable",
        id: 3),
    modeloSala(
        name: "Ana",
        icon: "person.svg",
        date: "26-Enero-2021",
        status: "Es muy metiche",
        id: 4),
    modeloSala(
        name: "Meño",
        icon: "person.svg",
        date: "12-Abril-2021",
        status: "Le gusta el arroz con popote",
        id: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: modeloSesion.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                recursoChat = modeloSesion.removeAt(index);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => PrincipalGrupo(
                              modeloSalaUsuarios: modeloSesion,
                              miUsuario: recursoChat,
                            )));
              },
              child: TarjetaBoton(
                  name: modeloSesion[index].name, icon: Icons.person))),
    );
  }
}
