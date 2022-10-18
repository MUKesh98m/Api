import 'dart:convert';

import '../model/model.dart';
import 'package:http/http.dart' as http;

Future<Getuserdata> Posttbook(
    String id, String username, String password) async {
  // print(id);
  final response = await http.post(
      Uri.parse('https://fakerestapi.azurewebsites.net/api/v1/Users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'id': id, 'userName': username, 'password': password}));
  print(response.body);
  if (response.statusCode == 201) {
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed
        .map<Getuserdata>((json) => Getuserdata.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to create album.');
  }
}
