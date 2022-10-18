import 'dart:convert';

import '../model/model.dart';
import 'package:http/http.dart' as http;

Future<List<Getuserdata>> Getbook() async {
  var response = await http.get(
    Uri.parse('https://fakerestapi.azurewebsites.net/api/v1/Users'),
  );
  if (response.statusCode == 200) {
    // final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    // return parsed
    //     .map<Getuserdata>((json) => Getuserdata.fromMap(json))
    //     .toList();
    // return
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed
        .map<Getuserdata>((json) => Getuserdata.fromJson(json))
        .toList();
    //  Getuserdata.fromJson(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}
