import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Button_component.dart';
import '../Components/Colors_component.dart';

class AddCategoryPage extends StatefulWidget {
  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  String? category;
  String? syoumi;
  bool showInputFields = false;
  String? foodname;
  String? memo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child:Column(
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
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    '追加',
                    style: TextStyle(
                      fontSize: 25,
                      // fontWeight: FontWeight.bold,
                      color: Colors_component.titleColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 45,
                ),
                CompleteButton(
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 330,
                height: 560,
                decoration: BoxDecoration(
                  color: Color(0x7A6C48).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Positioned(
                top: 0,
                left: 65,
                child: GestureDetector(
                  onTap: () {
                    // コンテナがタップされたときの処理をここに記述
                    Navigator.pushNamed(context, '/food');
                  },
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 30,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFFA1978B),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 39,
                          left: 140,
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 164, 237, 92),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 33,
                                color: Colors.white,
                              ),
                            ),
                          )

                        ),
                        Positioned(
                          top: 65,
                          left: 36,
                          child: Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                            size: 130,
                          ),
                        ),
                        Positioned(
                          top: 185,
                          left: 17,
                          child: Text(
                            '登録するものを撮影します',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ),

              Positioned(
                top: 250,
                child: CustomDropdownButton(
                  hint: 'カテゴリー',
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
                ),
              ),
              Positioned(
                top: 300,
                child: CustomDropdownButton(
                  hint: '賞味期限',
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
                ),
              ),
              Positioned(
                top: 350,
                child: Column(
                  children: [
                    if(!showInputFields)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showInputFields = true;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            '詳細設定',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        fixedSize: Size(230, 40),
                      ),
                    ),
                    if(showInputFields)
                      CustomTextField(
                        hintText: '名前:馬肉',
                        width: 230,
                        height: 40,
                        borderRadius: 30,
                        textSize: 20,
                        onChanged: (value) {
                          foodname = value;
                        },
                      ),
                    SizedBox(height: 10),
                    if (showInputFields)
                      CustomTextField(
                        hintText: '量:1/4',
                        width: 230,
                        height: 40,
                        borderRadius: 30,
                        textSize: 20,
                        onChanged: (value) {
                          foodname = value;
                        },
                      ),
                    SizedBox(height: 10),
                    if (showInputFields)
                      CustomTextField(
                        hintText: 'メモ:',
                        width: 230,
                        height: 80,
                        textSize: 20,
                        onChanged: (value) {
                          memo= value;
                        },
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
