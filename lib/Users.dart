// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.id,
    this.fullname,
    this.username,
    this.password,
    this.grade,
  });

  String id;
  String fullname;
  String username;
  String password;
  String grade;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        fullname: json["fullname"],
        username: json["username"],
        password: json["password"],
        grade: json["grade"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "password": password,
        "grade": grade,
      };
}
