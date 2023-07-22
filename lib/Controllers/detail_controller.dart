import 'package:flutter/cupertino.dart';
import 'package:hiyayakko/Arguments/food_to_detail.dart';

import '../Views/detail_page.dart';

class DetailController  extends StatelessWidget{
  const DetailController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as FoodToDetail;
    String? foodName = args.foodName;
    String? category = args.category;
    String? expiryDate = args.expiryDate;
    String? quantity = args.quantity;
    String? imagePath = args.imagePath;

    return DetailPage(
      foodName: foodName,
      category: category,
      expiryDate: expiryDate,
      quantity: quantity,
      imagePath: imagePath,
    );
  }
}