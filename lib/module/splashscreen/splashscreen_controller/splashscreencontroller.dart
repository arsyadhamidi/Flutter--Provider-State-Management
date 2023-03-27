import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/module/dashboard/view/dashboard_page.dart';
import 'package:task3/module/login/view/login_page.dart';

class SplashScreenController with ChangeNotifier{

  SplashScreenController(BuildContext context) {
    init(context);
  }

  void init(BuildContext context){
    getSplash(context);
  }

  void getSplash(BuildContext context) async{
    Future.delayed(Duration(seconds: 3), () async {
      var prefs = await SharedPreferences.getInstance();
      var data = prefs.getString("dataUser");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)
          => data != null ? DashboardPage() : LoginPage()), (route) => false);
    });
  }

}