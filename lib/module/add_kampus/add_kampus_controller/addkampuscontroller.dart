import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task3/constant/constantfile.dart';

class AddKampusController with ChangeNotifier {
  TextEditingController isNamaKampusCont = TextEditingController();
  TextEditingController isNamaJurusanCont = TextEditingController();
  TextEditingController isNamaProdiCont = TextEditingController();

  Future<void> addDataKampus(BuildContext context) async {
    try {
      final response =
          await http.post(Uri.parse(ConstantFile.url + "addkampus.php"), body: {
        "nama_kampus": isNamaKampusCont.text,
        "nama_jurusan": isNamaJurusanCont.text,
        "nama_prodi": isNamaProdiCont.text,
      });
      var addKamapus = jsonDecode(response.body);
      if (addKamapus != null) {
        Navigator.pop(context);
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text("Add Data Campus Successfully!")));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.red,
                content: Text("Add Data Campus Failed!")));
      }
    } catch (e) {
      print(e);
    }
  }
}
