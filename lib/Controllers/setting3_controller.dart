import 'package:flutter/material.dart';
import 'package:hiyayakko/Modeles/set_userinfomation.dart';
import 'package:hiyayakko/Views/setting3_page.dart';

import '../Arguments/setting2_to_setting3.dart';


class Setting3Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Setting2ToSetting3 args = ModalRoute.of(context)!.settings.arguments as Setting2ToSetting3;
    SetUserInfomation(name: args.name, gender: args.gender, age: args.age);
    return Setting3Page();
  }
}
