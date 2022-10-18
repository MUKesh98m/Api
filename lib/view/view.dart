import 'package:api/constroller/get.dart';
import 'package:api/view/update.dart';
import 'package:api/view/userentry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constroller/delete.dart';
import '../constroller/postdata.dart';
import '../model/model.dart';

class Getdata extends StatefulWidget {
  const Getdata({Key? key}) : super(key: key);

  @override
  State<Getdata> createState() => _GetdataState();
}

class _GetdataState extends State<Getdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Getuserdata>>(
        future: Getbook(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => Container(
                  child: Card(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => update(
                                  id: snapshot.data![index].id.toString(),
                                  username: snapshot.data![index].userName,
                                  password: snapshot.data![index].password,
                                )));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Text(snapshot.data![index].id.toString())),
                    subtitle: Text(snapshot.data![index].password.toString()),
                    title: Text(snapshot.data![index].userName.toString()),
                    trailing: IconButton(
                        onPressed: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //         title: Text(
                          //             snapshot.data![index].id.toString()));
                          //   },
                          // );
                          // deleteAlbum(5.toString());
                          deleteAlbum(snapshot.data![index].id.toString());
                        },
                        icon: Icon(Icons.delete)),
                  ),
                ),
              )),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => postdata()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
