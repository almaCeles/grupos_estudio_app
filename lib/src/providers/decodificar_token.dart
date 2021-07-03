import 'dart:convert';

import 'package:jaguar_jwt/jaguar_jwt.dart';

Map<String, dynamic> decofificar(String tok) {
  var jsonResponse;
  final String token = tok;
  final parts = token.split('.');
  final payload = parts[1];
  final String decoded = B64urlEncRfc7515.decodeUtf8(payload);
  jsonResponse = json.decode(decoded);
  return jsonResponse;
}
