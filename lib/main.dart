import 'package:flutter/material.dart';
import 'package:task3/module/splashscreen/view/splashscreen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplasScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

