
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:grupos_estudio_app/model/modeloSala.dart';
import 'package:grupos_estudio_app/src/pages/Salas.dart';
import '../screens/ContactosGrupo.dart';

class PrincipalGrupo extends StatefulWidget {
  PrincipalGrupo({Key key, this.modeloSalaUsuarios, this.miUsuario})
      : super(key: key);
  final List<modeloSala> modeloSalaUsuarios;
  final modeloSala miUsuario;
  @override
  _PrincipalGrupo createState() => _PrincipalGrupo();
}

class _PrincipalGrupo extends State<PrincipalGrupo>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: Text("ALGORITMIA"),
        actions: [
          // IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          PopupMenuButton<String>(
              icon: Icon(Icons.settings),
              onSelected: (value) {
                if (value == "Integrantes del grupo") {
                  print(widget.modeloSalaUsuarios.length);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ContactosGrupo(
                                contactos: widget.modeloSalaUsuarios,
                              )));
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("Integrantes del grupo"),
                    value: "Integrantes del grupo",
                  ),
                  PopupMenuItem(
                    child: Text("Acerca de este grupo"),
                    value: "Acerca de este grupo",
                  ),
                  PopupMenuItem(
                    child: Text("Configuracion del grupo"),
                    value: "Configuracion del grupo",
                  ),
                ];
              }),
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              child: SvgPicture.asset(
                "assets/chat.svg",
                color: Color(0xFFFDA77F),
                width: 27,
                height: 27,
              ),
            ),
            Tab(
              text: "<RELAJADO>",
            ),
            Tab(
              child: SvgPicture.asset(
                "assets/lista.svg",
                color: Color(0xFFFDA77F),
                width: 27,
                height: 27,
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text("Aqui sera el chat general"),
          Text("Aqui se desplegara las vistas generales de las salas, o para " +
              "hacerlo mas sensillo podriamos poner de momento solo la ultima " +
              "sala que se hubiese creado, por default "),
          Salas(miUsuario: widget.miUsuario)
        ],
      ),
    );
  }
}

// class GradientBack extends StatelessWidget {
//   final String title;
//   GradientBack(this.title);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50.0,
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
//               begin: FractionalOffset(0.2, 0.0),
//               end: FractionalOffset(1.0, 0.6),
//               stops: [0.0, 0.6],
//               tileMode: TileMode.clamp)),
//       child: Text(title,
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 30.0,
//               fontFamily: "Lato",
//               fontWeight: FontWeight.bold)),
//       alignment: Alignment(-0.9, -0.6),
//     );
//   }
// }
