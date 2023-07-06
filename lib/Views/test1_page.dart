import 'package:flutter/material.dart';

import '../Arguments/test1_to_test2.dart';
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
          Text("モデルテスト：" + isTrue(true)),//isTrueはModelesフォルダーの下にあるファイルから持ってきた変数です
          ElevatedButton(
              onPressed: (){
                //次のページへ値を渡す際値受け渡しのためのクラス(Argumentsフォルダー下のファイル)を作って渡しています。
                Navigator.pushNamed(context, '/test2page', arguments: Test1ToTest2("テストだよ", 1));
              },
              child: Text("次のページへ"),
          ),
        ],
      ),
    );
  }
}
