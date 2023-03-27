import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task3/constant/constantfile.dart';

class UpdateKampusController with ChangeNotifier {
  UpdateKampusController(String nama_kampus,
      String nama_jurusan, String nama_prodi) {
    isNamaKampusCont.text = nama_kampus;
    isNamaJurusanCont.text = nama_jurusan;
    isNamaProdiCont.text = nama_prodi;
  }

  TextEditingController isidKampusCont = TextEditingController();
  TextEditingController isNamaKampusCont = TextEditingController();
  TextEditingController isNamaJurusanCont = TextEditingController();
  TextEditingController isNamaProdiCont = TextEditingController();

  updateDataKampus(BuildContext context, String id_kampus) async {
    try {
      final response = await http
          .post(Uri.parse(ConstantFile.url + "updatekampus.php"), body: {
        "id_kampus": id_kampus,
        "nama_kampus": isNamaKampusCont.text,
        "nama_jurusan": isNamaJurusanCont.text,
        "nama_prodi": isNamaProdiCont.text
      });

      var updateKampus = jsonDecode(response.body);

      if (updateKampus != null) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text("Update Data Successfully!")));
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red, content: Text("Update Data Failed!")));
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
