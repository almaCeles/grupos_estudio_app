// To parse this JSON data, do
//
//     final mTemasSalas = mTemasSalasFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MTemasSalas mTemasSalasFromMap(String str) => MTemasSalas.fromMap(json.decode(str));

String mTemasSalasToMap(MTemasSalas data) => json.encode(data.toMap());

class MTemasSalas {
    MTemasSalas({
        @required this.groups,
    });

    List<Group> groups;

    factory MTemasSalas.fromMap(Map<String, dynamic> json) => MTemasSalas(
        groups: List<Group>.from(json["groups"].map((x) => Group.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "groups": List<dynamic>.from(groups.map((x) => x.toMap())),
    };
}

class Group {
    Group({
        @required this.fechaCreacion,
        @required this.numeroIntegrantes,
        @required this.integrantes,
        @required this.id,
        @required this.nombre,
        @required this.creador,
        @required this.carrera,
        @required this.categoria,
        @required this.maximoIntegrantes,
        @required this.codigoGrupo,
        @required this.v,
    });

    DateTime fechaCreacion;
    int numeroIntegrantes;
    List<String> integrantes;
    String id;
    String nombre;
    String creador;
    String carrera;
    String categoria;
    int maximoIntegrantes;
    String codigoGrupo;
    int v;

    factory Group.fromMap(Map<String, dynamic> json) => Group(
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        numeroIntegrantes: json["numeroIntegrantes"],
        integrantes: List<String>.from(json["integrantes"].map((x) => x)),
        id: json["_id"],
        nombre: json["nombre"],
        creador: json["creador"],
        carrera: json["carrera"],
        categoria: json["categoria"],
        maximoIntegrantes: json["maximoIntegrantes"],
        codigoGrupo: json["codigoGrupo"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "numeroIntegrantes": numeroIntegrantes,
        "integrantes": List<String>.from(integrantes.map((x) => x)),
        "_id": id,
        "nombre": nombre,
        "creador": creador,
        "carrera": carrera,
        "categoria": categoria,
        "maximoIntegrantes": maximoIntegrantes,
        "codigoGrupo": codigoGrupo,
        "__v": v,
    };
}
