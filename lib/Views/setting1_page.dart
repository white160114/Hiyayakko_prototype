import 'package:flutter/material.dart';
import 'package:hiyayakko/Arguments/account_data_notifier.dart';
import 'package:hiyayakko/Arguments/setting1_to_setting2.dart';
import 'package:hiyayakko/Views/setting2_page.dart';
import 'package:provider/provider.dart';


class Setting1Page extends StatelessWidget {
  String? email;  //入力したメールアドレス
  String? password; //入力したパスワード
  String? checkPassword;  //も一度

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
                SizedBox(height: 0),
                CustomTextField(
                  hintText: 'メールアドレスを入力してください',
                  width: 270,
                  height: 60,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 60),
                CustomTextField(
                  hintText: 'パスワードを入力してください',
                  width: 270,
                  height: 60,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(height: 60),
                CustomTextField(
                  hintText: 'もう一度パスワードを入力してください',
                  width: 270,
                  height: 60,
                  onChanged: (value){
                    checkPassword = value;
                  },
                ),
                SizedBox(height: 60,),
                CustomButton(
                  buttonText: '次へ',
                  onPressed: () {
                    //画面遷移
                    Navigator.pushNamed(context, '/setting/page2', arguments: Setting1ToSetting2(email, password, checkPassword));
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}


//テキスト入力クラス
class CustomTextField extends StatefulWidget {
  final String hintText;
  final double width;
  final double height;
  final double textSize;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.width = 270,
    this.height = 60,
    this.textSize = 12,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFF5F5F5),
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _textEditingController,
            onChanged: widget.onChanged,
            decoration: InputDecoration.collapsed(
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: widget.textSize),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: widget.textSize),
          ),
        ),
      ),
    );
  }
}



//nextボタンクラス
class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(fontSize: 20),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromARGB(204, 164, 237, 92),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(330, 60),
        ),
        elevation: MaterialStateProperty.all<double>(0),
      ),
      child: Text(buttonText),
    );
  }
}