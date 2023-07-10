import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiyayakko/Views/setting1_page.dart';

import 'invitationOK.dart';

class Invitationcode extends StatefulWidget {
  @override
  _InvitationcodeState createState() => _InvitationcodeState();
}

class _InvitationcodeState extends State<Invitationcode> {
  List<String> _codeCharacters = List.generate(9, (index) => '');
  List<FocusNode> _focusNodes = List.generate(9, (index) => FocusNode());
  List<TextEditingController> _controllers = List.generate(9, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

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
              '招待コードを入力\nしてください',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 37,
                color: Color(0xFF72777A),
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < 9; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: i == 4
                        ? Text(
                      '-',
                      style: TextStyle(fontSize: 20.0),
                    )
                        : Container(
                      width: 32.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                      ),
                      child: TextField(
                        controller: _controllers[i],
                        focusNode: _focusNodes[i],
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 20.0),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            _codeCharacters[i] = value;
                            _focusNodes[i].unfocus();
                            if (i == 3) {
                              _focusNodes[i + 2].requestFocus();
                            } else if (i < 8) {
                              _focusNodes[i + 1].requestFocus();
                            }
                          }
                        },
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(height: 220),
            CustomButton(
              buttonText: '次へ',
              onPressed: () {

                // 招待コードを使用する処理を実行
                String invitationCode = _codeCharacters.join('');

                // 画面遷移
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InvitationOK(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
