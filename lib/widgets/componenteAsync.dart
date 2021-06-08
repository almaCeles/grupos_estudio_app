import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/model/Post.dart';
/*import 'package:flutter_svg/flutter_svg.dart';
import 'package:grupos_estudio_app/model/modeloSala.dart';*/
import 'package:grupos_estudio_app/src/pages/contenidoSala.dart';
import '../src/fetch/fetchPost.dart';

class FetchPost extends StatelessWidget {
  final Future<Post> post;
  FetchPost({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContenidoSala(
//                      modeloS: modeloS,
//                      miUsuario: miUsuario,
                    )));
      },
      child: Column(children: [
/////////////////////////////////////////

        FutureBuilder<Post>(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
//      return Text(snapshot.data.title);
              return Text(snapshot.data.name);
            } else if (snapshot.hasError) {
              print("------------------>>error");
              return Text("${snapshot.error}");
            }

            // Por defecto, muestra un loading spinner
            return CircularProgressIndicator();
          },
        ),

///////////////////////////////

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
