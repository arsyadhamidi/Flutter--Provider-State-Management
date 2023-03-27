import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/constant/constantfile.dart';
import 'package:task3/global/data_global.dart';
import 'package:task3/model/listmodelkampus.dart';
import 'package:task3/model/modeluser.dart';
import 'package:http/http.dart' as http;
import 'package:task3/network/network.dart';

class DashboardController with ChangeNotifier {
  DashboardController(BuildContext context) {
    init(context);
  }

  void init(BuildContext context) {
    listDataKampus(context);
    getUser();
  }

  bool isLoading = false;
  List<ListModelKampus>? listkampus;

  Future<List<ListModelKampus>?> listDataKampus(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await NetworkProvider().getDataKampus();
      if (response != null) {
        listkampus = response;
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red, content: Text("List Kampus Failed!")));
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var users = prefs.getString("dataUser");
    print(jsonDecode(users ?? ''));
    dataGlobal.user = modelUserFromJson(users ?? '');
    notifyListeners();
  }

  Future<void> deleteDataKampus(BuildContext context, String id_kampus) async {
    try {
      final response = await http.post(
          Uri.parse(ConstantFile.url + "deletekampus.php"),
          body: {"id_kampus": id_kampus});
      List<ListModelKampus> hapuskampus =
          listModelKampusFromJson(response.body);
      if (hapuskampus == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text("Delete Successfully!")));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("Delete Failed!")));
      }
    } catch (e) {
      print(e);
    }
  }
}
