// To parse this JSON data, do
//
//     final gruposCreador = gruposCreadorFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GruposCreador gruposCreadorFromJson(String str) =>    GruposCreador.fromJson(json.decode(str));

String gruposCreadorToJson(GruposCreador data) => json.encode(data.toJson());

class GruposCreador {
  GruposCreador({
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

  final DateTime fechaCreacion;
  final String numeroIntegrantes;
  final List<dynamic> integrantes;
  final int id;
  final String nombre;
  final String creador;
  final String carrera;
  final String categoria;
  final int maximoIntegrantes;
  final String codigoGrupo;
  final int v;

  factory GruposCreador.fromJson(Map<String, dynamic> json) => GruposCreador(
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        numeroIntegrantes: json["numeroIntegrantes"],
        integrantes: List<dynamic>.from(json["integrantes"].map((x) => x)),
        id: json["_id"],
        nombre: json["nombre"],
        creador: json["creador"],
        carrera: json["carrera"],
        categoria: json["categoria"],
        maximoIntegrantes: json["maximoIntegrantes"],
        codigoGrupo: json["codigoGrupo"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "numeroIntegrantes": numeroIntegrantes,
        "integrantes": List<dynamic>.from(integrantes.map((x) => x)),
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
