
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grupos_estudio_app/model/m_Grupos_Creador.dart';
import 'package:http/http.dart' as http;

class gruposServices{

 gruposServices._intenal();

 static  gruposServices _instanse = gruposServices._intenal();
 static gruposServices get instanse =>  _instanse;

  Future<List<GruposCreador>> getGruposCreados()async{
     var url = Uri.http("127.0.0.1:5000", "/api/v1/my-own-grups", {"usuario":"alma"});
    print("holaaa");
    print(url);
    Map<String, String> headers = {
      "Context-Type": "application/json;charSet=UTF-8"
    };
    print(headers);
    var jsonResponse;

    var res = await http.get(url, headers: headers);
    
    print(res.statusCode);
    print(res.request);

    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      print(jsonResponse);

      try{}catch (e){
        print(e);
        return null;
      }

        print((res.body  as List)
              .map((e) => GruposCreador.fromJson(e))
              .toList());
        return (res.body  as List)
              .map((e) => GruposCreador.fromJson(e))
              .toList();


    } else {
      print("solicitud sin exito");
    }
  }

  Future<List<GruposCreador>> getGruposPertenesco( String id) async {
    var url =
        Uri.http("127.0.0.1:5000", "/api/v1/my-grups", {"usuario": id});
    print("holaaa");
    print(url);
    Map<String, String> headers = {
      "Context-Type": "application/json;charSet=UTF-8"
    };
    print(headers);
    var jsonResponse;

    var res = await http.get(url, headers: headers);

    print(res.statusCode);
    print(res.request);

    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      print(jsonResponse);

      try {} catch (e) {
        print(e);
        return null;
      }

      print((res.body as List).map((e) => GruposCreador.fromJson(e)).toList());
      return (res.body as List).map((e) => GruposCreador.fromJson(e)).toList();
    } else {
      print("solicitud sin exito");
    }
  }

   Future<List<GruposCreador>> getGruposTemas(String id) async {
    var url = Uri.http("127.0.0.1:5000", "/api/v1/my-grups", {"usuario": id});
    print("holaaa");
    print(url);
    Map<String, String> headers = {
      "Context-Type": "application/json;charSet=UTF-8"
    };
    print(headers);
    var jsonResponse;

    var res = await http.get(url, headers: headers);

    print(res.statusCode);
    print(res.request);

    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      print(jsonResponse);

      try {} catch (e) {
        print(e);
        return null;
      }

      print((res.body as List).map((e) => GruposCreador.fromJson(e)).toList());
      return (res.body as List).map((e) => GruposCreador.fromJson(e)).toList();
    } else {
      print("solicitud sin exito");
    }
  }
}