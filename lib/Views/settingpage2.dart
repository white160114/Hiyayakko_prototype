import 'package:flutter/material.dart';
import 'package:hiyayakko/Views/SettingPage1.dart';
import 'SettingPage3.dart';
import 'package:hiyayakko/Controllers/settingpage2_controller.dart';

class SettingPage2 extends StatefulWidget {
  @override
  _SettingPage2State createState() => _SettingPage2State();
}

class _SettingPage2State extends State<SettingPage2> {
  String name = '';
  String? selectedGender;
  String? selectedAge;
  List<String> ages = List.generate(101, (index) => '${index}歳');
  // List<String> ages = List.generate(101, (index) => index.toString());


  @override
  Widget build(BuildContext context) {
    final SettingPage2Controller controller = SettingPage2Controller();

    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 30),  //アイコンの位置
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
            Image.asset(
              'lib/Views/Images/hiya.png',
              width: 300,
              height: 140,
            ),
            SizedBox(height: 75),
            CustomTextField(
              hintText: '名前',
              width: 270,
              height: 60,
              textSize: 16,
              onChanged: (value) {
                name = value;
              },
            ),
            SizedBox(height: 60),
            CustomDropdownButton(
              hint: '性別',
              items: [
                DropdownMenuItem(value: '男性', child: Text('男性')),
                DropdownMenuItem(value: '女性', child: Text('女性')),
                DropdownMenuItem(value: 'その他', child: Text('その他')),
              ],
              onChanged: (String? value) {
                setState(() {
                  selectedGender = value;
                });
              },
              value: selectedGender,
            ),
            SizedBox(height: 60),
            CustomDropdownButton(
              hint: '年齢',
              items: [
                DropdownMenuItem(value: '年齢', child: Text('年齢')),
                for (String age in ages)
                  DropdownMenuItem(value: age, child: Text(age)),
              ],
              onChanged: (String? value) {
                setState(() {
                  selectedAge = value;
                });
              },
              value: selectedAge,
            ),
            SizedBox(height: 60),
            CustomButton(
              buttonText: '次へ',
              onPressed: () {
                controller.build(
                  Name: name,
                  Gender: selectedGender,
                  Age: selectedAge,
                );

                //画面遷移
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingPage3(),
                  ),
                );
              },
            ),
            SizedBox(height: 55),
          ],
        ),
      ),
    );
  }
}




//選択ボックスのクラス
class CustomDropdownButton extends StatefulWidget {
  final String hint;  //初期表示文字
  final List<DropdownMenuItem<String>> items;   //選択肢のリスト
  final ValueChanged<String?> onChanged;  //
  final String? value;

  CustomDropdownButton({
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,   //ボックスの横幅
      height: 60,   //縦幅
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black12,  //枠線の色
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16),  //角丸の半径
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            isExpanded: true,
            value: selectedValue,
            hint: Align(
              alignment: Alignment.center,
              child: Text(
                selectedValue ?? widget.hint,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            items: widget.items.map((DropdownMenuItem<String> item) {
              return DropdownMenuItem<String>(
                value: item.value,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    item.value!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
              widget.onChanged(value);
            },
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}