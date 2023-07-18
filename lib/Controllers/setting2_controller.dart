import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiyayakko/Arguments/setting1_to_setting2.dart';
import 'package:hiyayakko/Modeles/create_user.dart';
import 'package:hiyayakko/Views/setting2_page.dart';
import 'package:provider/provider.dart';

import '../Arguments/new_account_create_infomation_notifier.dart';


class Setting2Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Setting2Page();
  }

}
