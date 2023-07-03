import 'package:flutter/material.dart';
import 'package:hiyayakko/Controllers/test1_controller.dart';

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
      initialRoute: '/test',
      routes: {
        '/': (context) => SizedBox(),
        '/test': (context) => Test1Controller(),
        '/test2page': (context) => Test2Controller(),
      },
    );
  }
}
