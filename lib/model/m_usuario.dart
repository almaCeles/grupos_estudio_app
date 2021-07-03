import 'package:meta/meta.dart';
import 'dart:convert';

MUsuario mUsuarioFromJson(String str) => MUsuario.fromJson(json.decode(str));

String mUsuarioToJson(MUsuario data) => json.encode(data.toJson());

class MUsuario {
  MUsuario({
    @required this.id,
    @required this.usuario,
    @required this.nombre,
    @required this.apellidoP,
    @required this.apellidoM,
    @required this.carrera,
    @required this.email,
    @required this.createToken,
    @required this.exp,
  });

  final String id;
  final String usuario;
  final String nombre;
  final String apellidoP;
  final String apellidoM;
  final String carrera;
  final String email;
  final int createToken;
  final int exp;

  factory MUsuario.fromJson(Map<String, dynamic> json) => MUsuario(
        id: json["id"],
        usuario: json["usuario"],
        nombre: json["nombre"],
        apellidoP: json["apellido_P"],
        apellidoM: json["apellido_M"],
        carrera: json["carrera"],
        email: json["email"],
        createToken: json["createToken"],
        exp: json["exp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "nombre": nombre,
        "apellido_P": apellidoP,
        "apellido_M": apellidoM,
        "carrera": carrera,
        "email": email,
        "createToken": createToken,
        "exp": exp,
      };
}
