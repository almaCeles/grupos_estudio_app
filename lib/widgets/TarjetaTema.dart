import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grupos_estudio_app/model/modeloSala.dart';
import 'package:grupos_estudio_app/src/pages/contenidoSala.dart';

class TarjetaTema extends StatelessWidget {
  const TarjetaTema({Key key, this.modeloS, this.miUsuario}) : super(key: key);
  final modeloSala modeloS;
  final modeloSala miUsuario;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContenidoSala(
                      modeloS: modeloS,
                      miUsuario: miUsuario,
                    )));
      },
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: SvgPicture.asset(
              "assets/topico.svg",
              color: Color(0xFFFDA77F),
              width: 37,
              height: 37,
            ),
            backgroundColor: Color(0xFF5B7298),
          ),
          title: Text(
            modeloS.name,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF89A6E),
            ),
          ),
          subtitle: Text(modeloS.date),
          trailing:
              Icon(Icons.arrow_right_alt, color: Color(0xFFFDA77F), size: 45.0),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 80),
          child: Divider(
            thickness: 1,
          ),
        )
      ]),
    );
  }
}
