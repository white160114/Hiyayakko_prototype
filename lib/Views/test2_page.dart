import 'package:flutter/material.dart';
import '../Arguments/test1_to_test2.dart';

class Test2Page extends StatelessWidget {
  //testNumが理想の受け渡し方です
  //受け取る場所がばらばらだとメンテがしにくいのでview画面で直で受け取ってほしくないです。悪い例がargs.testです
  int? testNum;
  Test2Page({this.testNum, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //これはただの例です。できればコントローラのほうでデータの受け取りをしてコントラクタで受け取ってほしいです
    final Test1ToTest2 args = ModalRoute.of(context)!.settings.arguments as Test1ToTest2;
    print(args.runtimeType);
    return Scaffold(
      appBar: AppBar(
        title: Text("画面遷移テスト"),
      ),
      body: Column(
        children: [
          Text("成功"),
          Text(args.test),
          Text("${this.testNum}")
        ],
      ),
    );
  }
}
