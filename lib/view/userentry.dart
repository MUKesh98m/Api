import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constroller/postdata.dart';

class postdata extends StatefulWidget {
  const postdata({Key? key}) : super(key: key);

  @override
  State<postdata> createState() => _postdataState();
}

class _postdataState extends State<postdata> {
  TextEditingController idController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 100, right: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter The name"),
              controller: idController,
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter The job Title"),
              controller: usernameController,
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter The job Title"),
              controller: passwordController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  Posttbook(idController.text, usernameController.text,
                      passwordController.text);
                },
                child: Text("Submit"))
          ]),
        ),
      ),
    );
  }
}
