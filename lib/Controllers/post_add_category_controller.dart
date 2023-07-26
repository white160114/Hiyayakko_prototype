import 'package:flutter/cupertino.dart';
import 'package:hiyayakko/Arguments/add_to_posh_add.dart';
import 'package:hiyayakko/Modeles/add_thing_to_ref.dart';

import '../Views/addcategory_page.dart';

class PostAddCategoryController  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as AddToPostAdd;
    addThingToRef(args.foodName, args.category, args.expiryDate, args.quantity, args.imagePath);
    print("aaaaaaa");
    return AddCategoryPage();
  }
}