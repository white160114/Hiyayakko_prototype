import 'package:flutter/cupertino.dart';

import '../Arguments/add_to_food.dart';
import '../Views/food_page.dart';

class FoodController  extends StatelessWidget{
  const FoodController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as AddToFood?;
    String? foodName = args?.foodName;
    String? category = args?.category;
    String? expiryDate = args?.expiryDate;
    String? quantity = args?.quantity;
    String? imagePath = args?.imagePath;


    return FoodPage(
      foodName: foodName,
      category: category,
      expiryDate: expiryDate,
      quantity: quantity,
      imagePath: imagePath,
    );
  }
}