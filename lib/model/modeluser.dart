// To parse this JSON data, do
//
//     final modelUser = modelUserFromJson(jsonString);

import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
  ModelUser({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  int? status;
  bool? error;
  String? message;
  Data? data;

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
    status: json["status"],
    error: json["error"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.idUsers,
    this.nama,
    this.email,
    this.password,
  });

  String? the0;
  String? the1;
  String? the2;
  String? the3;
  String? idUsers;
  String? nama;
  String? email;
  String? password;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    the0: json["0"],
    the1: json["1"],
    the2: json["2"],
    the3: json["3"],
    idUsers: json["id_users"],
    nama: json["nama"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "1": the1,
    "2": the2,
    "3": the3,
    "id_users": idUsers,
    "nama": nama,
    "email": email,
    "password": password,
  };
}
