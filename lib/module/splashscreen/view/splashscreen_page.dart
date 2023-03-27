import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/module/dashboard/view/dashboard_page.dart';
import 'package:task3/module/login/view/login_page.dart';
import 'package:task3/module/splashscreen/splashscreen_controller/splashscreencontroller.dart';

class SplasScreenPage extends StatefulWidget {
  const SplasScreenPage({Key? key}) : super(key: key);

  @override
  State<SplasScreenPage> createState() => _SplasScreenPageState();
}

class _SplasScreenPageState extends State<SplasScreenPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashScreenController>(
      create: (context) => SplashScreenController(context),
      child: Consumer<SplashScreenController>(
        builder: (context, splashController, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                children: [
                  Spacer(),
                  Image.asset("assets/images/logo.png"),
                  Spacer(),
                  Text("Only This", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
