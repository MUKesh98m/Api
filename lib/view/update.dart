import 'dart:convert';
import 'package:api/view/view.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constroller/postdata.dart';
import '../constroller/update.dart';
import '../model/model.dart';

class update extends StatefulWidget {
  update({Key? key, this.id, this.username, this.password}) : super(key: key);
  final id;
  final username;
  final password;

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  TextEditingController idController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 100, right: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: widget.id),
              controller: idController,
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: widget.username),
              controller: usernameController,
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: widget.password),
              controller: passwordController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  updateAlbum(idController.text, usernameController.text,
                      passwordController.text);
                },
                child: Text("Submit"))
          ]),
        ),
      ),
    );
  }

  Future<Getuserdata?> updateAlbum(
      String id, String username, String password) async {
    final http.Response response = await http.put(
      Uri.parse('https://fakerestapi.azurewebsites.net/api/v1/Users/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'username': username,
        'password': password,
      }),
    );
// parsing JSOn or throwing an exception
    if (response.statusCode == 200) {
      if (Getuserdata.fromJson(json.decode(response.body)) == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Getdata()));
      }
    } else {
      return null;
    }
  }
}
