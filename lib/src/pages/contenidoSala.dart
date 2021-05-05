import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grupos_estudio_app/model/MessageModel.dart';
import 'package:grupos_estudio_app/model/modeloSala.dart';
import 'package:grupos_estudio_app/widgets/MensajeRespuesta.dart';
import 'package:grupos_estudio_app/widgets/MensajesPropios.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ContenidoSala extends StatefulWidget {
  ContenidoSala({Key key, this.modeloS, this.miUsuario}) : super(key: key);
  final modeloSala modeloS;
  final modeloSala miUsuario;

  @override
  _ContenidoSala createState() => _ContenidoSala();
}

class _ContenidoSala extends State<ContenidoSala> {
  IO.Socket socket;
  bool botonEnviar = false;
  List<MessageModel> messages = [];
  TextEditingController _controlador = TextEditingController();
  ScrollController _scrollC = ScrollController();
  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    socket = IO.io("http://127.0.0.1:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    //Este es el metodo que se ejecuta primero
    socket.onConnect((data) {
      print("Primero lo primero: Conectado al socket server");
      //el metodo de abajo no esta habilitado
      // socket.on("message", (msg) {
      //   print(msg);
      // });
    });
    //Primero al conectarse manda los datos: nombre_usuario, id_Sala al servidor
    socket.emit(
        "login", {"name": widget.miUsuario.name, "room": widget.modeloS.id});
    //El servidor responde con una notificaion:
    socket.on('notification', (messageData) => print(messageData));
    socket.on('users', (data) => print(data));
    socket.on(
        "message",
        (newmessage) => {
              print("-> " + newmessage["contentMessage"]),
              _scrollC.animateTo(_scrollC.position.maxScrollExtent,
                  duration: Duration(milliseconds: 150), curve: Curves.easeOut),
              setMessage("mensajeGrupo", newmessage["contentMessage"]),
            });
  }

  void sendMessagePerson(
      String message, int sourceId, int groupTarjet, String name) {
    setMessage("miMensaje", message);
    socket.emit("sendMessage", message);
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: message,
        currentTime: DateTime.now().toString().substring(10, 16));
    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xffFAFAF1),
          appBar: AppBar(
              leadingWidth: 90,
              leading: InkWell(
                  onTap: () {
                    socket.dispose();
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                      CircleAvatar(
                        child: SvgPicture.asset(
                          "assets/topico.svg",
                          color: Color(0xFFFDA77F),
                          width: 37,
                          height: 37,
                        ),
                        radius: 25,
                        backgroundColor: Color(0xFF5B7298),
                      ),
                    ],
                  )),
              title: Container(
                child: Column(
                  children: [
                    Text(
                      widget.modeloS.name,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w100,
                          color: Color(0xFFFDA77F)),
                    ),
                  ],
                ),
              )
              // actions: [IconButton(icon: Icon(Icons.more), onPressed: () {})],
              ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // child: WillPopScope(
            child: Column(
              children: [
                Expanded(
                  // height: MediaQuery.of(context).size.height - 140,
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollC,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      if (index == messages.length) {
                        return Container(
                          height: 70,
                        );
                      }
                      if (messages[index].type == "miMensaje") {
                        return MensajesPropios(
                          message: messages[index].message,
                          date: messages[index].currentTime,
                        );
                      } else {
                        return MensajeRespuesta(
                          message: messages[index].message,
                          date: messages[index].currentTime,
                        );
                      }
                    },
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 70,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 55,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      margin: EdgeInsets.only(
                                          left: 2, right: 2, bottom: 8),
                                      child: TextFormField(
                                          controller: _controlador,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 5,
                                          minLines: 1,
                                          onChanged: (value) {
                                            if (value.length > 0) {
                                              setState(() {
                                                botonEnviar = true;
                                              });
                                            } else {
                                              setState(() {
                                                botonEnviar = false;
                                              });
                                            }
                                          },
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Type a message",
                                            prefixIcon: IconButton(
                                                icon:
                                                    Icon(Icons.emoji_emotions),
                                                onPressed: () {}),
                                            suffixIcon: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                    icon:
                                                        Icon(Icons.attach_file),
                                                    onPressed: () {}),
                                                IconButton(
                                                    icon:
                                                        Icon(Icons.camera_alt),
                                                    onPressed: () {})
                                              ],
                                            ),
                                            contentPadding: EdgeInsets.all(5),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xff5B7298),
                                      foregroundColor: Color(0xFFFDA77F),
                                      radius: 25,
                                      child: IconButton(
                                        icon: Icon(
                                          botonEnviar ? Icons.send : Icons.mic,
                                        ),
                                        onPressed: () {
                                          if (botonEnviar) {
                                            _scrollC.animateTo(
                                                _scrollC
                                                    .position.maxScrollExtent,
                                                duration:
                                                    Duration(milliseconds: 150),
                                                curve: Curves.easeOut);
                                            //implementar la funcionalidad para mandarle el mensaje a todos
                                            sendMessagePerson(
                                                _controlador.text,
                                                widget.miUsuario.id,
                                                widget.modeloS.id,
                                                widget.miUsuario.name);
                                          }
                                          _controlador.clear();
                                          botonEnviar = false;
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ])))
              ],
              // ),
            ),
          ),
        )
      ],
    );
  }
}
