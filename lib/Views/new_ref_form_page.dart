import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiyayakko/Controllers/new_ref_form_controller.dart';
import 'new_ref_welcome_page.dart';
import 'setting1_page.dart';



class NewRefFormPage extends StatelessWidget {
  String refname = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: 150),
            Text(
              '冷蔵庫の名前を\n入力してください',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 37,
                color: Color(0xFF72777A),
              ),
            ),
            SizedBox(height: 120),
            CustomTextField(
              hintText: '名前',
              width: 270,
              height: 60,
              textSize: 16,
              onChanged: (value) {
                refname = value;
              },
            ),
            SizedBox(height: 110),
            CustomButton(
              buttonText: '次へ',
              onPressed: () {

                //画面遷移
                Navigator.pushNamed(context, "/setting/newRef/welcome");
              },
            ),
          ],
        ),
      ),
    );
  }
}
