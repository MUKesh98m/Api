import 'dart:convert';

import 'package:http/http.dart';

import '../model/model.dart';

import 'package:http/http.dart' as http;

Future<Getuserdata?> deleteAlbum(String id) async {
  Response res = await http.delete(
      Uri.parse('https://fakerestapi.azurewebsites.net/api/v1/Users/$id'));

  if (res.statusCode == 200) {
    print("Deleted");
    // return Getuserdata.fromJson(jsonDecode(res.body));
  } else {
    throw "Sorry! Unable to delete this post.";
  }
}
