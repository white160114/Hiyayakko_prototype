import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Button_component.dart';
import '../Components/Colors_component.dart';

class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, right: 10),
                  child: CustomBackButton(
                    onPressed: () {
                      Navigator.pop(context); // 1ページ戻る処理
                    },
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    '詳細',
                    style: TextStyle(
                      fontSize: 30,
                      // fontWeight: FontWeight.bold,
                      color: Colors_component.titleColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 45,
                ),
                Column(
                  children:[
                    Padding(
                      padding: EdgeInsets.only(top: 23),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo_sharp,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '削除',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE1E1E1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          fixedSize: Size(105, 30),
                        ),
                      ),
                    ),
                    SizedBox(height: 0,),
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/edit');
                        },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors_component.gold,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '編集',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors_component.gold,
                                ),
                              ),
                            ],
                          ),
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE1E1E1),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        ),
                        fixedSize: Size(105, 30),
                        ),
                      ),
                    ),
                  ]
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 330,
                height: 539,
                decoration: BoxDecoration(
                  color: Color(0x98BB6B).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Positioned(
                top: 0,
                child: Column(
                children: [
                Image.asset(
                  'lib/Views/Images/bigexamplemeat.png',
                  height: 200, // 新しい高さを指定
                  width: 200, // 新しい幅を指定
                ),
                  SizedBox(height: 0,),
                  CustomContainer(
                    text: '名前；馬肉',
                  ),
                  SizedBox(height: 15,),
                  CustomContainer(text: 'カテゴリー:肉'),
                  SizedBox(height: 15,),
                  CustomContainer(text: '賞味期限:7/2'),
                  SizedBox(height: 15,),
                  CustomContainer(text: '量:1/4'),
                  SizedBox(height: 15,),
                  CustomContainer(
                      text: 'メモ:',
                      containerHeight: 80,
                    circular: 15,
                  ),
                ],
              )
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
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
          ),
        ],
      ),
    );
  }
}


class CustomContainer extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  final String text;
  final double fontSize;
  final double circular;

  CustomContainer({
    this.containerHeight = 40,
    this.containerWidth = 230,
    required this.text,
    this.fontSize = 20,
    this.circular = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(circular),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child:
      Padding(
        padding: EdgeInsets.only(top: 3,left: 30),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Color(0xFF72777A),
        ),
      ),
      ),
    );
  }
}
