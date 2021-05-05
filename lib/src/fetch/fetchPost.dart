import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:grupos_estudio_app/model/Post.dart';

Future<Post> fetchPost() async {
  var url = Uri.parse('http://localhost:5000/api/v1/themes');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('failed to load post');
  }
}
