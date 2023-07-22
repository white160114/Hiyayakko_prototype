import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Button_component.dart';
import '../Components/Colors_component.dart';
import 'detail_page.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String? category;
  String? expiryDate;
  String? quantity;
  String? memo;
  String? foodname;

  Future<void> _selectExpiryDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != expiryDate) {
      setState(() {
        // 月、日の情報だけを取得して保存する
        expiryDate = "${pickedDate.month}/${pickedDate.day}";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // スクロールできるようにするためにSingleChildScrollViewでラップ
        child: Column(
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
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      '編集',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors_component.titleColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  CompleteButton(onPressed: () {

                  }),
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 330,
                  height: 539,
                  decoration: BoxDecoration(
                    color: Color(0x98BB6B).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/Views/Images/bigexamplemeat.png',
                        height: 200, // 新しい高さを指定
                        width: 200, // 新しい幅を指定
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Container(
                        height: 40,
                        width: 230,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CustomTextField(
                          hintText: '名前:馬肉',
                          width: 230,
                          height: 40,
                          borderRadius: 30,
                          textSize: 20,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            setState(() {
                              foodname = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomDropdownButton(
                        hint: 'カテゴリー:肉',
                        items: [
                          DropdownMenuItem(value: '肉', child: Text('肉')),
                          DropdownMenuItem(value: '魚', child: Text('魚')),
                          DropdownMenuItem(value: '野菜', child: Text('野菜')),
                          DropdownMenuItem(value: '飲み物', child: Text('飲み物')),
                          DropdownMenuItem(value: 'お酒', child: Text('お酒')),
                          DropdownMenuItem(value: '調味料', child: Text('調味料')),
                          DropdownMenuItem(value: 'その他', child: Text('その他')),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            category = value;
                          });
                        },
                        value: category,
                        buttonWidth: 230,
                        buttonHeight: 40,
                        textSize: 20,
                        borderRadius: 30,
                        hintTextAlign: TextAlign.left,
                        textcolor: Colors_component.fontgrey,
                        shadowBlurRadius: 5.0,
                        shadowSpreadRadius: 3,
                        shadowColor: Colors.black.withOpacity(0.2),
                        shadowOffset: Offset(0,4),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: _selectExpiryDate, // GestureDetectorでonTapを使います。
                        child: CustomDropdownButton(
                          hint: '賞味期限: ${expiryDate != null ? expiryDate!.split(' ')[0] : "3/02"}',                          items: [/* 他のドロップダウンアイテム */],
                          onChanged: (String? value) {
                            setState(() {
                              expiryDate = value;
                            });
                          },
                          value: expiryDate,
                          buttonWidth: 230,
                          buttonHeight: 40,
                          textSize: 20,
                          borderRadius: 30,
                          hintTextAlign: TextAlign.left,
                          textcolor: Colors_component.fontgrey,
                          shadowBlurRadius: 5.0,
                          shadowSpreadRadius: 3,
                          shadowColor: Colors.black.withOpacity(0.2),
                          shadowOffset: Offset(0,4),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomDropdownButton(
                        hint: '量:1/4',
                        items: [
                          DropdownMenuItem(value: '肉', child: Text('肉')),
                          DropdownMenuItem(value: '魚', child: Text('魚')),
                          DropdownMenuItem(value: '野菜', child: Text('野菜')),
                          DropdownMenuItem(value: '飲み物', child: Text('飲み物')),
                          DropdownMenuItem(value: 'お酒', child: Text('お酒')),
                          DropdownMenuItem(value: '調味料', child: Text('調味料')),
                          DropdownMenuItem(value: 'その他', child: Text('その他')),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            quantity = value;
                          });
                        },
                        value: quantity,
                        buttonWidth: 230,
                        buttonHeight: 40,
                        textSize: 20,
                        borderRadius: 30,
                        hintTextAlign: TextAlign.left,
                        textcolor: Colors_component.fontgrey,
                        shadowBlurRadius: 5.0,
                        shadowSpreadRadius: 3,
                        shadowColor: Colors.black.withOpacity(0.2),
                        shadowOffset: Offset(0,4),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 80,
                        width: 230,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              memo = value;
                            });
                          },
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF72777A),
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            hintText: 'メモ',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomNavbar(
              colorFilters: [
                ColorFilter.mode(Colors.white, BlendMode.modulate),
                ColorFilter.mode(Colors.white, BlendMode.modulate),
                ColorFilter.mode(Colors.white, BlendMode.modulate),
                ColorFilter.mode(Colors.brown, BlendMode.modulate),
                ColorFilter.mode(Colors.white, BlendMode.modulate),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
