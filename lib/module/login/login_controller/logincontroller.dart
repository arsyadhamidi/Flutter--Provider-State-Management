import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task3/constant/constantfile.dart';
import 'package:task3/model/modeluser.dart';
import 'package:task3/module/dashboard/view/dashboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController with ChangeNotifier {
  TextEditingController isEmailCont = TextEditingController();
  TextEditingController isPasswordCont = TextEditingController();

  addUserLogin(BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(ConstantFile.url + "login.php"), body: {
        "email": isEmailCont.text,
        "password": isPasswordCont.text,
      });

      ModelUser addUser = modelUserFromJson(response.body);
      if (addUser.status == 200) {
        ModelUser? dataUser = addUser;
        print("Full Name : ${dataUser.data?.nama},"
            " Email Address: ${dataUser.data?.email},"
            " Password: ${dataUser.data?.password}");

        await savePreferences(dataUser);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
            (route) => false);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text("Login Successfully"))
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("Login Failed"))
        );
      }
    } catch (e) {}
  }

  Future<void> savePreferences(ModelUser dataUser) async{
    SharedPreferences prefsUser = await SharedPreferences.getInstance();
    prefsUser.setString('dataUser', jsonEncode(dataUser));
  }

  bool isObsurce = true;

  inHidePassword(){
    if(isObsurce == true){
      isObsurce = false;
      notifyListeners();
    }else{
      isObsurce = true;
      notifyListeners();
    }
  }
}
