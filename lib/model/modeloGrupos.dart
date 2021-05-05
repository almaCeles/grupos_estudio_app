// To parse this JSON data, do
//
//     final modeGrupos = modeGruposFromJson(jsonString);

import 'dart:convert';

ModeGrupos modeGruposFromJson(String str) => ModeGrupos.fromJson(json.decode(str));

String modeGruposToJson(ModeGrupos data) => json.encode(data.toJson());

class ModeGrupos {
    ModeGrupos({
        this.id,
        this.nombre,
        this.admin,
        this.fkUsuario,
    });

    int id;
    String nombre;
    bool admin;
    int fkUsuario;

    factory ModeGrupos.fromJson(Map<String, dynamic> json) => ModeGrupos(
        id: json["id"],
        nombre: json["nombre"],
        admin: json["admin"],
        fkUsuario: json["fk_usuario"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "admin": admin,
        "fk_usuario": fkUsuario,
    };
}
