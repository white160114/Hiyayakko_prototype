import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hiyayakko/Modeles/get_category_to_firestore.dart';
import 'package:hiyayakko/Views/category_page.dart';

class CategoryController  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategoryToFirestore(),
      builder: (context, snapshot) {
        List category = snapshot.data!;
        return CategoryPage(category: category,);
      }
    );
  }

}