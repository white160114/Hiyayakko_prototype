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
                SizedBox(width: 60,),
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
                CompleteButton(
                  onPressed: (){

                  },
                )
              ],
            ),
          ),
          SizedBox(height: 15,),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 330,
                height: 560,
                decoration: BoxDecoration(
                  color: Color(0x7A6C48).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Positioned(
                top: 30,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFA1978B),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                top: 39,
                  left: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Color.fromARGB(255, 164, 237, 92),
                      fixedSize: Size(45, 45), // ボタンの幅と高さを指定
                      elevation: 10, // 影の大きさを指定
                    ),
                    onPressed: (){

                    },
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 33, // アイコンのサイズを指定
                      ),
                    ),
                  ),
              ),
              Positioned(
                top: 65,
                child: Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                  size: 130,
                ),
              ),
              Positioned(
                top: 185,
                  child: Text(
                    '登録するものを撮影します',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
              ),
            ],
          ),
          SizedBox(height: 10,),
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
          )        ],
      ),
    );
  }
}