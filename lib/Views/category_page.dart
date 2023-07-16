import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiyayakko/Components/Colors_component.dart';

import '../Components/Button_component.dart';

class CategoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children:[
         Row(
           children:[
             CustomBackButton(
               onPressed: (){

               },
             ),
             SizedBox(width: 30,),
             Text(
               'カテゴリー',
               style: TextStyle(
                 color: Colors_component.titleColor,
                 fontSize: 20,
               ),
             ),
             ElevatedButton(
                 onPressed: (){

                 },
                 style: ElevatedButton.styleFrom(
                   shape: CircleBorder(),
                   backgroundColor: Color.fromARGB(255, 164, 237, 92),
                   fixedSize: Size(50, 50), // ボタンの幅と高さを指定
                   elevation: 10, // 影の大きさを指定
                 ),
                 child: Center(
                   child: Icon(
                     Icons.keyboard_return,
                     size: 33, // アイコンのサイズを指定
                   ),
                 ),
             ),
          ]
         )
       ]
     ),
    );
  }
}