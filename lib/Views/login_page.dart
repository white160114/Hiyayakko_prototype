import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Controllers/login_controller.dart';
import 'setting1_page.dart';

class LoginPage extends StatelessWidget {
  String email = '';  //入力したメールアドレス
  String password = ''; //入力したパスワード

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(height: 70,),
              Image.asset(
                'lib/Views/Images/hiya.png',
                width: 300,
                height: 200,
              ),
              SizedBox(height: 30),
              CustomTextField(
                hintText: 'メールアドレスを入力してください',
                width: 270,
                height: 60,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 80),
              CustomTextField(
                hintText: 'パスワードを入力してください',
                width: 270,
                height: 60,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 60),
              SizedBox(height: 60,),
              CustomButton(
                buttonText: '次へ',
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    // 画面遷移
                    Navigator.pushNamed(context, '/home',);
                  } catch(error) {
                    print(error);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}