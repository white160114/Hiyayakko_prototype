import 'package:flutter/cupertino.dart';
import 'package:hiyayakko/Arguments/detail_to_edit.dart';

import '../Views/edit_page.dart';

class EditPageController  extends StatelessWidget{
  const EditPageController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailToEdit;
    String? name = args.name;
    String? category = args.category;
    String? expiryDate = args.expiryDate;
    String? quantity = args.quantity;
    String? imagePath = args.imagePath;

    return EditPage(
      name: name,
      category: category,
      expiryDate: expiryDate,
      quantity: quantity,
      imagePath: imagePath,
    );
  }
}