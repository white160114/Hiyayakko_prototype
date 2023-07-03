import 'package:flutter/material.dart';
import 'package:hiyayakko/Controllers/test1_controller.dart';

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
      routes: {
        '/': (context) => Test1Controller(),
      },
    );
  }
}
