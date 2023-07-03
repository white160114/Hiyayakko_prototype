import 'package:flutter/material.dart';
import '../Arguments/test1_to_test2.dart';

class Test2Page extends StatelessWidget {
  const Test2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Text("${args.num}")
        ],
      ),
    );
  }
}
