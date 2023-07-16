import 'package:flutter/material.dart';
import 'package:hiyayakko/Controllers/ctegory_controller.dart';
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
      initialRoute: '/category',
      routes: {
        //ルーディング例
        //url: (context) => ページクラス
        '/': (context) => SizedBox(),
        '/test': (context) => Test1Controller(),
        '/test2page': (context) => Test2Controller(),
        '/category': (context) => CategoryController(),
      },
    );
  }
}
