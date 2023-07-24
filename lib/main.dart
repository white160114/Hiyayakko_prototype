import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hiyayakko/Arguments/account_data_notifier.dart';
import 'package:hiyayakko/Controllers/first_controller.dart';
import 'package:hiyayakko/Controllers/login_controller.dart';
import 'package:hiyayakko/Controllers/new_ref_form_controller.dart';
import 'package:hiyayakko/Controllers/setting1_controller.dart';
import 'package:hiyayakko/Controllers/setting2_controller.dart';
import 'package:hiyayakko/Controllers/setting3_controller.dart';
import 'package:hiyayakko/Controllers/ctegory_controller.dart';
import 'package:hiyayakko/Controllers/meat_controller.dart';
import 'package:hiyayakko/Controllers/test1_controller.dart';
import 'package:provider/provider.dart';

import 'Controllers/home_controller.dart';
import 'Controllers/invitation_form_controller.dart';
import 'Controllers/invitation_success_controller.dart';
import 'package:hiyayakko/Controllers/getcode_controller.dart';
import 'package:hiyayakko/Controllers/test1_controller.dart';
import 'package:hiyayakko/Views/editpro_page.dart';
import 'package:hiyayakko/Views/profiel_page.dart';

import 'Controllers/editpro_controller.dart';
import 'Controllers/profiel_controller.dart';
import 'Controllers/test2_controller.dart';
import 'Controllers/new_ref_welcome_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AccountData(),
      child: _MyApp()
    );
  }
}

class _MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ひややっ庫",
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),

      initialRoute: '/firstPage',

      routes: {
        '/': (context) => SizedBox(),
        '/firstPage': (context) => FirstController(),
        '/login': (context) => LoginController(),
        '/setting/page1': (context) => Setting1Controller(),
        '/setting/page2': (context) => Setting2Controller(),
        '/setting/page3': (context) => Setting3Controller(),
        '/setting/newRef/form': (context) => NewRefFormController(),
        '/setting/newRef/welcome': (context) => NewRefWelcomeController(),
        '/setting/invitation/form': (context) => InvitationFormController(),
        '/setting/invitation/succes': (context) => InvitationSuccessController(),
        '/home': (context) => HomeController(),
        '/test': (context) => Test1Controller(),
        '/test2page': (context) => Test2Controller(),
        '/profiel': (context) => ProfielController(),
        '/edit': (context) => EditproController(),
        '/getcode':(context) => GetCodeController(),
        '/category': (context) => CategoryController(),
        '/meat' :(context) => MeatController(),
      },
    );
  }
}

