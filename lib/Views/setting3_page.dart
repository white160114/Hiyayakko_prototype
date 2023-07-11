import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'invitationcode.dart';

class Setting3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, top: 30),
            child: IconButton(
              icon: Icon(
                Icons.keyboard_return,
                color: Color(0xFFA4ED5C),
                size: 50,
              ),
              onPressed: () {
                Navigator.pop(context); // 1ページ戻る
              },
            ),
          ),
          SizedBox(height: 100),
          Text(
            '冷蔵庫を作成\nまたは\n招待コードを入力',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 37,
              color: Color(0xFF72777A),
            ),
          ),
          SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Invitationcode(),
                    ),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.black, // ボタンの文字の色を指定
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(163, 55),
                  ),
                  elevation: MaterialStateProperty.all<double>(0),  //影をなくす
                ),
                child: Text('招待コードを入力'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/newRef');
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 14),
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white, // ボタンの文字の色を指定
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(204, 164, 237, 92),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(163, 55),
                  ),
                  elevation: MaterialStateProperty.all<double>(0),  //影をなくす
                ),
                child: Text('新しく冷蔵庫を作る'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
