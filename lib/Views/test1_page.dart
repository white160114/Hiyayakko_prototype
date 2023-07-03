import 'package:flutter/material.dart';

class Test1Page extends StatelessWidget {
  final String testVariable;
  Test1Page({required this.testVariable, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("テストページ"),
      ),
      body: Column(
        children: [
          Text(testVariable)
        ],
      ),
    );
  }
}
