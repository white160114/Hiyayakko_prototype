import 'package:flutter/material.dart';
import 'package:hiyayakko/Modeles/set_user_infomation.dart';
import 'package:hiyayakko/Views/setting3_page.dart';
import 'package:provider/provider.dart';

import '../Arguments/account_data_notifier.dart';
import '../Modeles/create_user.dart';


class Setting3Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AccountData data = Provider.of<AccountData>(context);
    // CreateUser(context: context, email: data.email, password: data.password, checkPassword: data.checkPassword, name: data.name, gender: data.gender, age: int.parse(data.age!));
    print("\n\n\n\nユーザー情報をセットします\n\n\n\n\n");
    setUserInfomation(name: data.name!, gender: data.gender, age: int.parse(data.age!));
    return Setting3Page();
  }
}
