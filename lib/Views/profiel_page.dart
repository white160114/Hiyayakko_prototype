import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiyayakko/Components/Button_component.dart';
import 'package:hiyayakko/Components/Colors_component.dart';

import '../main.dart';
import 'editpro_page.dart';
import 'getcode_page.dart';


class ProfielPage extends StatelessWidget {
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
                  )
                ),
                SizedBox(width: 8),
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Text(
                    'プロフィール画面',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors_component.titleColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Container(
            margin: EdgeInsets.only(left: 10), // 左側の余白を設定
            child: Row(
              children: [
                Image.asset(
                  'lib/Views/Images/accountbig.png', // 2番目の画像のパスを指定してください
                  width: 100, // 画像の幅を指定
                  height: 100, // 画像の高さを指定
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '岩田和貴',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '2220394@ecc.ac.jp',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5,),
          ElevatedButton(
            onPressed: () {
              // ボタンが押された時の処理
              Navigator.pushNamed(context,"/edit");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit_calendar, // 使用するアイコンの指定
                  color: Colors_component.gold, // アイコンの色を設定
                ),
                SizedBox(width: 8), // アイコンとテキストの間隔を設定
                Text(
                  'プロフィール編集',
                  style: TextStyle(
                    fontSize: 16,
                    color:Colors_component.gold,
                  ),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFE1E1E1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              fixedSize: Size(250, 30),
            ),
          ),
          SizedBox(height: 20,),
          DecoratedLine(
            width: double.infinity,
          ),
          SizedBox(height: 15,),

          Align(
            alignment: Alignment(-0.8,0), //設定の左右位置
            child: Text(
              '設定',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: 10,),

          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '・通知設定',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(width: 140,),
                    Transform.scale(
                      scale: 1.1,  // 大きさを調整（1.0がデフォルト）
                      child: CupertinoSwitch(
                        value: true,
                        onChanged: (value) {
                          // スイッチの状態が変更された時の処理

                        },
                        activeColor: Color(0xFF6B4EFF),  // オンの色
                        trackColor: Colors.grey,         // オフの色
                        thumbColor: Colors.white,        // ハンドルの色
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 0,),
              Text(
                '通知設定をOFFにすると通知がされなくなります',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerRight,  // 全体を右側に寄せる
            child: DecoratedLine(
              width: 350,
            )
          ),

          SizedBox(height: 20,),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '・通知設定',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(width: 140,),
                    Transform.scale(
                      scale: 1.1,  // 大きさを調整（1.0がデフォルト）
                      child: CupertinoSwitch(
                        value: true,
                        onChanged: (value) {
                          // スイッチの状態が変更された時の処理
                        },
                        activeColor: Color(0xFF6B4EFF),  // オンの色
                        trackColor: Colors.grey,         // オフの色
                        thumbColor: Colors.white,        // ハンドルの色
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 0,),
              Text(
                '効果音をOFFにすると効果音が鳴らなくなります',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerRight,  // 全体を右側に寄せる
            child: DecoratedLine(
              width: 350,
            )
          ),
          SizedBox(height: 20,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '・招待コード',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '     招待コードを発行します',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 80,),
              ElevatedButton(
                onPressed: () {
                  // ボタンが押された時の処理
                  Navigator.pushNamed(context, "/getcode");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add, // 使用するアイコンの指定
                      color: Color(0xFF6B4EFF), // アイコンの色を設定
                    ),
                    SizedBox(width: 5), // アイコンとテキストの間隔を設定
                    Text(
                      '発行',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6B4EFF),
                        fontWeight: FontWeight.bold, // テキストの太さを設定
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // ボタン色
                  side: BorderSide(color: Colors.grey, width: 1.0), // 枠線の設定
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(95, 45),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerRight,  // 全体を右側に寄せる
            child: DecoratedLine(
              width: 350,
            )
          ),
          SizedBox(height: 70,),
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
          )
        ],
      ),
    );
  }
}

//線のクラス
class DecoratedLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double borderWidth;
  final double blurRadius;
  final double spreadRadius;
  final Offset offset;

  const DecoratedLine({
    required this.width,
    this.height = 1.0,
    this.color = Colors.black,
    this.borderWidth = 1.0,
    this.blurRadius = 4.0,
    this.spreadRadius = 2.0,
    this.offset = const Offset(0, 2),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              spreadRadius: spreadRadius,
              blurRadius: blurRadius,
              offset: offset,
            ),
          ],
        ),
      ),
    );
  }
}
