import 'package:flutter/material.dart';
import 'package:hiyayakko/Views/setting3_page.dart';
import 'package:provider/provider.dart';

import '../Arguments/new_account_create_infomation_notifier.dart';
import '../Modeles/create_user.dart';


class Setting3Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewAccountCreateData data = Provider.of<NewAccountCreateData>(context);
    CreateUser(context: context, email: data.email, password: data.password, checkPassword: data.checkPassword, name: data.name, gender: data.gender, age: int.parse(data.age!));
    return Setting3Page();
  }
}
