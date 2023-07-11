import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiyayakko/Arguments/setting1_to_setting2.dart';
import 'package:hiyayakko/Modeles/create_user.dart';
import 'package:hiyayakko/Views/setting2_page.dart';


class Setting2Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Setting1ToSetting2 args = ModalRoute.of(context)!.settings.arguments as Setting1ToSetting2;
    CreateUser(context: context, email: args.email, password: args.password, checkPassword: args.checkPassword);
    return Setting2Page();
  }

}
