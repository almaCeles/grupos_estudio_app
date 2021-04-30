import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/widgets/TarjetaIntegrante.dart';
import '../model/modeloSala.dart';

class ContactosGrupo extends StatefulWidget {
  ContactosGrupo({Key key, this.contactos}) : super(key: key);
  final List<modeloSala> contactos;

  @override
  _ContactosGrupo createState() => _ContactosGrupo();
}

class _ContactosGrupo extends State<ContactosGrupo> {
  @override
  Widget build(BuildContext context) {
    // List<modeloSala> contactos = [
    //   modeloSala(name: "La Alma", status: "Una persona muy desidiosa"),
    //   modeloSala(name: "Axer", status: "Me debe 10 pesos"),
    //   modeloSala(name: "Victor", status: "Es un compañero responsable"),
    //   modeloSala(name: "Ana", status: "Es muy metiche"),
    //   modeloSala(name: "Meño", status: "Le gusta el arroz con popote"),
    // ];
    return Scaffold(
        appBar: AppBar(
            title: Column(
          children: [
            Text("Lista de integrantes",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            Text(widget.contactos.length.toString() + "/6",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200))
          ],
        )),
        body: ListView.builder(
            itemCount: widget.contactos.length,
            itemBuilder: (context, index) => TarjetaIntegrante(
                  contacto: widget.contactos[index],
                )));
  }
}
