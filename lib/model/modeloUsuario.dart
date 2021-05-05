// To parse this JSON data, do
//
//     final modelUsuario = modelUsuarioFromJson(jsonString);

import 'dart:convert';

ModelUsuario modelUsuarioFromJson(String str) => ModelUsuario.fromJson(json.decode(str));

String modelUsuarioToJson(ModelUsuario data) => json.encode(data.toJson());

class ModelUsuario {
    ModelUsuario({
        this.id,
        this.nombre,
        this.apellido,
        this.email,
        this.carrera,
    });

    int id;
    String nombre;
    String apellido;
    String email;
    String carrera;

    factory ModelUsuario.fromJson(Map<String, dynamic> json) => ModelUsuario(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        carrera: json["carrera"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "carrera": carrera,
    };
}
