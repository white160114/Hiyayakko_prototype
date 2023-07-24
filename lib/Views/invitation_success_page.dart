
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiyayakko/Views/setting1_page.dart';

import 'new_ref_welcome_page.dart';

class InvitationSuccessPage extends StatelessWidget {

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
          SizedBox(height: 230,),
          Text(
            '招待されました',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 37,
              color: Color(0xFF72777A),
            ),
          ),
          SizedBox(height: 230,),
          CustomButton(
            buttonText: '次へ',
            onPressed: () {
              //画面遷移
              Navigator.pushNamed(context, "/setting/newRef/welcome");
            },
          ),
        ],
      ),
    );
  }
}