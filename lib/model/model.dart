// To parse this JSON data, do
//
//     final getuserdata = getuserdataFromJson(jsonString);

import 'dart:convert';

class Getuserdata {
  int? id;
  String? userName;
  String? password;

  Getuserdata({this.id, this.userName, this.password});

  Getuserdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['password'] = this.password;
    return data;
  }
}
// To parse this JSON data, do
//
//     final getuserdata = getuserdataFromJson(jsonString);

// import 'dart:convert';
//
// List<Getuserdata> getuserdataFromJson(String str) =>
//     List<Getuserdata>.from(json.decode(str).map((x) => Getuserdata.fromMap(x)));
//
// String getuserdataToJson(List<Getuserdata> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Getuserdata {
//   Getuserdata({
//     required this.id,
//     required this.userName,
//     required this.password,
//   });
//
//   int id;
//   String userName;
//   String password;
//
//   factory Getuserdata.fromMap(Map<String, dynamic> json) => Getuserdata(
//     id: json["id"],
//     userName: json["userName"],
//     password: json["password"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "userName": userName,
//     "password": password,
//   };
// }
