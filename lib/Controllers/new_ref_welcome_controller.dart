import 'package:flutter/material.dart';
import 'package:hiyayakko/Arguments/new_ref_form_to_new_ref_welcome.dart';
import 'package:hiyayakko/Modeles/create_ref.dart';
import 'package:hiyayakko/Views/new_ref_welcome_page.dart';


class NewRefWelcomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewRefFormToNewRefWelcome args = ModalRoute.of(context)!.settings.arguments as NewRefFormToNewRefWelcome;
    createRef(args.refName, args.refID);
    return NewRefWelcomePage(refname: args.refName);
  }

}
