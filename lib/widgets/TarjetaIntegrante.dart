/*import 'package:chat_client/model/modeloSala.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';*/

import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/model/modeloSala.dart';
import 'package:flutter_svg/svg.dart';

class TarjetaIntegrante extends StatelessWidget {
  const TarjetaIntegrante({Key key, this.contacto}) : super(key: key);
  final modeloSala contacto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: ListTile(
          leading: CircleAvatar(
            radius: 23,
            child: SvgPicture.asset(
              "assets/person.svg",
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            backgroundColor: Color(0xFF584CD1),
          ),
          title: Text(
            contacto.name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(contacto.status),
        ));
  }
}
