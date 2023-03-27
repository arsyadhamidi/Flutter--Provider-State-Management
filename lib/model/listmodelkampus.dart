// To parse this JSON data, do
//
//     final listModelKampus = listModelKampusFromJson(jsonString);

import 'dart:convert';

List<ListModelKampus> listModelKampusFromJson(String str) => List<ListModelKampus>.from(json.decode(str).map((x) => ListModelKampus.fromJson(x)));

String listModelKampusToJson(List<ListModelKampus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListModelKampus {
  ListModelKampus({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.idKampus,
    this.namaKampus,
    this.namaJurusan,
    this.namaProdi,
    this.createdAt,
  });

  String? the0;
  String? the1;
  String? the2;
  String? the3;
  DateTime? the4;
  String? idKampus;
  String? namaKampus;
  String? namaJurusan;
  String? namaProdi;
  DateTime? createdAt;

  factory ListModelKampus.fromJson(Map<String, dynamic> json) => ListModelKampus(
    the0: json["0"],
    the1: json["1"],
    the2: json["2"],
    the3: json["3"],
    the4: json["4"] == null ? null : DateTime.parse(json["4"]),
    idKampus: json["id_kampus"],
    namaKampus: json["nama_kampus"],
    namaJurusan: json["nama_jurusan"],
    namaProdi: json["nama_prodi"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "1": the1,
    "2": the2,
    "3": the3,
    "4": the4?.toIso8601String(),
    "id_kampus": idKampus,
    "nama_kampus": namaKampus,
    "nama_jurusan": namaJurusan,
    "nama_prodi": namaProdi,
    "created_at": createdAt?.toIso8601String(),
  };
}
