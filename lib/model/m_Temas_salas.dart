// To parse this JSON data, do
//
//     final mTemasSalas = mTemasSalasFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MTemasSalas mTemasSalasFromMap(String str) =>
    MTemasSalas.fromMap(json.decode(str));

String mTemasSalasToMap(MTemasSalas data) => json.encode(data.toMap());

class MTemasSalas {
  MTemasSalas({
    @required this.message,
    @required this.room,
  });

  String message;
  Room room;

  factory MTemasSalas.fromMap(Map<String, dynamic> json) => MTemasSalas(
        message: json["message"],
        room: Room.fromMap(json["Room"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "Room": room.toMap(),
      };
}

class Room {
  Room({
    @required this.createdAt,
    @required this.id,
    @required this.idGrupo,
    @required this.nombreSala,
    @required this.contenido,
    @required this.v,
  });

  DateTime createdAt;
  String id;
  String idGrupo;
  String nombreSala;
  Contenido contenido;
  int v;

  factory Room.fromMap(Map<String, dynamic> json) => Room(
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["_id"],
        idGrupo: json["idGrupo"],
        nombreSala: json["nombreSala"],
        contenido: Contenido.fromMap(json["contenido"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt.toIso8601String(),
        "_id": id,
        "idGrupo": idGrupo,
        "nombreSala": nombreSala,
        "contenido": contenido.toMap(),
        "__v": v,
      };
}

class Contenido {
  Contenido({
    @required this.texto,
  });

  String texto;

  factory Contenido.fromMap(Map<String, dynamic> json) => Contenido(
        texto: json["texto"],
      );

  Map<String, dynamic> toMap() => {
        "texto": texto,
      };
}
