import 'package:flutter/material.dart';

import '../Arguments/test1_to_test2.dart';
import '../Views/test2_page.dart';

class Test2Controller extends StatelessWidget {
  const Test2Controller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Test1ToTest2 args = ModalRoute.of(context)!.settings.arguments as Test1ToTest2;
    int testNum = 5 * args.num;
    return Test2Page(testNum: testNum,);
  }
}
