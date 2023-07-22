import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Button_component.dart';
import '../Components/Colors_component.dart';

class FoodPage extends StatelessWidget{
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
                SizedBox(width: 60,),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    '食品',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors_component.titleColor,
                    ),
                  ),
                ),
                SizedBox(width: 45,),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child:ElevatedButton(
                    onPressed: (){

                    },
                    child: Text(
                        'カテゴリー別'
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF70C783),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      fixedSize: Size(120, 43), // ボタンの幅を変更
                      elevation: 7,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child:Align(
              alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/detail');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.sort,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5,), // アイコンとテキストの間のスペースを追加
                      Text(
                        '絞り込み',
                        style: TextStyle(
                          fontSize: 14, // テキストのサイズを変更
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF80BD33),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fixedSize: Size(120, 40), // ボタンの幅を変更
                  ),
                ),
                SizedBox(width: 115,),
                CustomAddButton(onPressed: (){}),
              ],
            ),
          )
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                CategoryWidget(
                  name: '馬肉',
                  category: '肉',
                  expiryDate: '2023/5/19',
                  quantity: '残り使ってない',
                  imagePath: 'lib/Views/Images/examplemeat.png',
                ),
                CategoryWidget(
                  name: '魚',
                  category: '魚',
                  expiryDate: '2023/6/19',
                  quantity: '残り半分',
                  imagePath: 'lib/Views/Images/examplemeat.png',
                ),

              ],
            ),
          ),
          SizedBox(height: 100,),
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
              },
                  () {
                // 4番目の画像がタップされたときの処理
              },
                  () {
                // 5番目の画像がタップされたときの処理
              },
            ],
          )
        ],
      ),
    );
  }
}