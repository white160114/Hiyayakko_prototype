import 'package:flutter/material.dart';
import 'package:hiyayakko/Controllers/test1_controller.dart';
import 'package:hiyayakko/Views/FirstPage.dart';
import 'package:hiyayakko/Views/LoginPage.dart';

import 'Controllers/test2_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ひややっ庫",
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      initialRoute: '/firstPage',
      routes: {
        '/': (context) => SizedBox(),
        '/firstpage': (context) => FirstPage(),
        '/login': (context) => LoginPage(),
        '/test': (context) => Test1Controller(),
        '/test2page': (context) => Test2Controller(),
      },
    );
  }
}
