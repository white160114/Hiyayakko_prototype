import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiyayakko/Controllers/login_controller.dart';

import 'LoginPage.dart';
import 'SettingPage1.dart';

class FirstPage extends StatelessWidget {

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
              SizedBox(height: 100),
              SizedBox(
                width: 300,
                height: 60,
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(204, 164, 237, 92),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'ログイン',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),

                  ),
                ),
              ),
              SizedBox(height: 80),
              SizedBox(
                width: 300,
                height: 60,
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingPage1(),
                      ),
                    );
                  },
                  child: Text(
                    '新規登録',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}