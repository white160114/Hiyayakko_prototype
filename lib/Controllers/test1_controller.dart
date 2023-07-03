import 'package:flutter/material.dart';

import '../Views/test1_page.dart';

class Test1Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String testVariable = "値の受け渡しのテストです";
    return Test1Page(testVariable: testVariable,);
  }

}
