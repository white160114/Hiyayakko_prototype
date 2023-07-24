import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiyayakko/Components/Colors_component.dart';

import '../Components/Button_component.dart';

class CategoryPage extends StatelessWidget{
  List category;
  CategoryPage({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    category.forEach(print);
    return Scaffold(
     body: Column(
       children:[
         Container(
           child: Row(
             children: [
               Padding(
                   padding: EdgeInsets.only(left: 30, top: 40, right: 10),
                   child: CustomBackButton(
                     onPressed: () {
                       Navigator.pop(context); // 1ページ戻る処理
                     },
                   )
               ),
               SizedBox(width: 10),
               Padding(
                 padding: EdgeInsets.only(top: 40),
                 child: Text(
                   'カテゴリー',
                   style: TextStyle(
                     fontSize: 25,
                     // fontWeight: FontWeight.bold,
                     color: Colors_component.titleColor,
                   ),
                 ),
               ),
               SizedBox(width: 10,),
               Padding(
                 padding: EdgeInsets.only(top: 40),
                 child:CustomAddButton(
                   onPressed: (){
                      Navigator.pushNamed(context, '/addcategory',);
                   },
                 )
               ),
             ],
           ),
         ),
         SizedBox(height: 100,),
         Container(
           alignment: Alignment.center,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CustomButton(
                 onPressed: (){
                    Navigator.pushNamed(context, "/meat");
                 },
                 imagePath: 'lib/Views/Images/meat.png',
                 label: '肉',
                 textSize: 15,
               ),
               SizedBox(width: 5),
               CustomButton(
                 onPressed: (){

                 },
                 imagePath: 'lib/Views/Images/drink.png',
                 label: '飲み物',
               ),
               SizedBox(width: 5),
               CustomButton(
                 onPressed: (){

                 },
                 imagePath: 'lib/Views/Images/salt.png',
                 label: '調味料',
               )
             ],
           ),
         ),
         SizedBox(height: 20,),
         Container(
           alignment: Alignment.center,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CustomButton(
                 onPressed: (){

                 },
                 imagePath: 'lib/Views/Images/fish.png',
                 label: '魚',
                 textSize: 15,
               ),
               SizedBox(width: 5),
               CustomButton(
                 onPressed: (){

                 },
                 imagePath: 'lib/Views/Images/beer.png',
                 label: 'お酒',
               ),
               SizedBox(width: 5),
               CustomButton(
                 onPressed: (){

                 },
                 imagePath: null,
                 label: 'その他',
                 textSize: 15,
               )
             ],
           ),
         ),
         SizedBox(height: 20,),
         Container(
           child: Row(
             children: [
               SizedBox(width: 12,),
               CustomButton(
                 onPressed: (){

                 },
                 imagePath: 'lib/Views/Images/vegetable.png',
                 label: '野菜',
                 textSize: 15,
               ),
             ],
           ),
         ),
         SizedBox(height: 230,),
         CustomNavbar(
             colorFilters: [
                ColorFilter.mode(Colors.white, BlendMode.modulate),
                ColorFilter.mode(Colors.white, BlendMode.modulate),
                ColorFilter.mode(Colors.white, BlendMode.modulate),
                ColorFilter.mode(Colors.brown, BlendMode.modulate),
                ColorFilter.mode(Colors.white, BlendMode.modulate),
             ],
           onTapCallbacks: [
                 () {
               // 1番目の画像がタップされたときの処理
             },
                 () {
               // 2番目の画像がタップされたときの処理
             },
                 () {
               // 3番目の画像がタップされたときの処理
               Navigator.pushNamed(context, '/home');
             },
                 () {
               // 4番目の画像がタップされたときの処理
               Navigator.pushNamed(context, '/category');//後で全体表示に変える
             },
                 () {
               // 5番目の画像がタップされたときの処理
               Navigator.pushNamed(context, '/profiel');
             },
           ],
         )
       ]
     ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? imagePath;
  final String label;
  final double textSize;

  const CustomButton({
    required this.onPressed,
    this.imagePath,
    required this.label,
    this.textSize = 12.5,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null)
            Image.asset(
              imagePath!,
            ),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: textSize,
              color: Colors.black,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFE1E1E1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        fixedSize: Size(120, 70),
      ),
    );
  }
}
