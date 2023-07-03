import 'package:flutter/material.dart';

import '../Modeles/test1_model.dart';

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
          Text("受け渡しテスト" + testVariable),
          Text("モデルテスト：" + isTrue(true)),
        ],
      ),
    );
  }
}
