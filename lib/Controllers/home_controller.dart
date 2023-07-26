import 'package:flutter/material.dart';
import 'package:hiyayakko/Arguments/new_ref_welcome_to_home.dart';
import 'package:hiyayakko/Views/home_page.dart';


class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewRefWelcomeToHome args = ModalRoute.of(context)!.settings.arguments as NewRefWelcomeToHome;
    return HomePage(refname: args.refName);
  }

}
