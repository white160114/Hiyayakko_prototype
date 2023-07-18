import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Button_component.dart';
import '../Components/Colors_component.dart';

class AddCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                SizedBox(width: 40,),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    '追加',
                    style: TextStyle(
                      fontSize: 25,
                      // fontWeight: FontWeight.bold,
                      color: Colors_component.titleColor,
                    ),
                  ),
                ),
                SizedBox(width: 45,),
                Padding(
                    padding: EdgeInsets.only(top: 40,),
                    child:CustomAddButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/addcategory',);
                      },
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}