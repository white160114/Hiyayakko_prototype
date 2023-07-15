import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiyayakko/Views/profiel_page.dart';

import '../Components/Button_component.dart';
import '../Components/Colors_component.dart';

class EditproPage extends StatefulWidget {
  @override
  _EditproPage createState() => _EditproPage();
}


class _EditproPage extends State<EditproPage>{
  String? selectedGender;
  String? selectedAge;
  List<String> ages = List.generate(101, (index) => '${index}歳');


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors_component.globalBackgroundColor,
    body: Column(
      children:[
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
              SizedBox(width: 0),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'プロフィール編集画面',
                  style: TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    color: Colors_component.titleColor,
                  ),
                ),
              ),
              SizedBox(width: 0,),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child:ElevatedButton(
                  onPressed: () {
                    // ボタンが押された時の処理
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditproPage(),
                        )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check, // 使用するアイコンの指定
                        color: Colors_component.gold, // アイコンの色を設定
                      ),
                      SizedBox(width: 10), // アイコンとテキストの間隔を設定
                      Text(
                        '完了',
                        style: TextStyle(
                          fontSize: 15,
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
                    fixedSize: Size(100, 30),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 0,),
        Stack(
          clipBehavior: Clip.none,
          children:[
            Image(
                image: AssetImage('lib/Views/Images/editaccount.png'),
            ),
            Positioned(
              left: 70,
              bottom: -7,
              child:ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Color(0xFF6EDB3A),
                  fixedSize: Size(10, 10), // ボタンの幅と高さを指定
                  elevation: 10, // 影の大きさを指定
                ),
                onPressed:(){},
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 30, // アイコンのサイズを指定
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40,),
        Padding(
          padding: EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(
                  Icons.edit_calendar,
                color: Colors_component.gold,
              ),
              SizedBox(width: 8),
              Text(
                '名前:',
                style: TextStyle(
                  color: Colors_component.gold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 20,),
              Text(
                '名前名前',
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10,),
        Padding(
            padding: EdgeInsets.only(right: 70),
          child: DecoratedLine(
            width: 240,
          )
        ),
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(
                Icons.edit_calendar,
                color: Colors_component.gold,
              ),
              SizedBox(width: 8),
              Text(
                'メールアドレス:',
                style: TextStyle(
                  color: Colors_component.gold,
                  fontSize: 17,
                ),
              ),
              SizedBox(width: 10,),
              Text(
                '2220909@egg.ag.jo',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10,),
        Align(
          alignment: Alignment.centerRight,  // 全体を右側に寄せる
          child: DecoratedLine(
            width: 350,
          )
        ),
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.only(left: 90),
          child: Row(
            children: [
              Text(
                '性別:',
                style: TextStyle(
                  color: Colors_component.gold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10,),
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
            ],
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: EdgeInsets.only(right: 50),
          child: DecoratedLine(
            width: 250,
          )
        ),
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.only(left: 90),
          child: Row(
            children: [
              Text(
                '年齢:',
                style: TextStyle(
                  color: Colors_component.gold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10,),
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
            ],
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: EdgeInsets.only(right: 50),
          child: DecoratedLine(
            width: 250,
          )
        ),
        SizedBox(height: 197,),
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
        ),
      ]
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
      width: 100,   //ボックスの横幅
      height: 35,   //縦幅
      decoration: BoxDecoration(
        color: Colors.transparent,
        // border: Border.all(
        //   color: Colors.black12,  //枠線の色
        //   width: 1.0,
        // ),
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
                  fontSize: 23,
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
                      fontSize: 23,
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