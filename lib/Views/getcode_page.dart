import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiyayakko/Components/Colors_component.dart';

import '../Components/Button_component.dart';

class GetCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_component.globalBackgroundColor,
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
                  ),
                ),
                SizedBox(width: 15),
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Text(
                    '招待コード発行',
                    style: TextStyle(
                      fontSize: 25,
                      // fontWeight: FontWeight.bold,
                      color: Colors_component.titleColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100,),
          Stack(
            children: [
              Container(
                width: 300,
                height: 270,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), //色の薄さ
                      blurRadius: 0,
                      spreadRadius: 0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 80,
                left: 90,
                child: Column(
                  children: [
                    Text(
                      '招待コード',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '2AIO-98WN',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 210,),
          CustomNavbar(colorFilters: [
            ColorFilter.mode(Colors.white,BlendMode.modulate),
            ColorFilter.mode(Colors.white,BlendMode.modulate),
            ColorFilter.mode(Colors.white,BlendMode.modulate),
            ColorFilter.mode(Colors.white,BlendMode.modulate),
            ColorFilter.mode(Colors.brown,BlendMode.modulate),
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
              ]
          ),
        ],
      ),
    );
  }
}
