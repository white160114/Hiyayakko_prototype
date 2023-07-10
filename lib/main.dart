import 'package:flutter/material.dart';
import 'package:hiyayakko/Controllers/first_controller.dart';
import 'package:hiyayakko/Controllers/login_controller.dart';
import 'package:hiyayakko/Controllers/new_ref_controller.dart';
import 'package:hiyayakko/Controllers/setting1_controller.dart';
import 'package:hiyayakko/Controllers/setting2_controller.dart';
import 'package:hiyayakko/Controllers/setting3_controller.dart';
import 'package:hiyayakko/Controllers/test1_controller.dart';
import 'package:hiyayakko/Views/first_page.dart';
import 'package:hiyayakko/Views/login_page.dart';

import 'Controllers/test2_controller.dart';
import 'Views/setting1_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ひややっ庫",
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      initialRoute: '/firstPage',
      routes: {
        '/': (context) => SizedBox(),
        '/firstPage': (context) => FirstController(),
        '/login': (context) => LoginController(),
        '/setting/page1': (context) => Setting1Controller(),
        '/setting/page2': (context) => Setting2Controller(),
        '/setting/page3': (context) => Setting3Controller(),
        '/newRef': (context) => NewRefController(),
        '/test': (context) => Test1Controller(),
        '/test2page': (context) => Test2Controller(),
      },
    );
  }
}
