import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiyayakko/Arguments/add_to_posh_add.dart';

import '../Components/Button_component.dart';
import '../Components/Colors_component.dart';

class AddCategoryPage extends StatefulWidget {
  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  String? category;
  String? expiryDate; //賞味期限
  String? foodName;
  String? quantity;//量
  String? imagePath = 'examplemeat.png';
  String? memo;
  bool showInputFields = false;

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

  void _onCompleteButtonPressed() {
    if (category != null && expiryDate != null) {
      CategoryWidget newCategoryWidget = CategoryWidget(
        foodName: foodName,
        category: category,
        expiryDate: expiryDate,
        quantity: quantity,
        imagePath: imagePath,
      );
      Navigator.pop(context, newCategoryWidget);
    }
  }

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
                      color: Colors_component.titleColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 45,
                ),
                CompleteButton(
                  onPressed: () {
                    print(category);
                    print(expiryDate);
                    print(foodName);
                    print(quantity);
                    print(memo);

                    Navigator.pushNamed(context, 'post/add_category', arguments: AddToPostAdd(foodName, category, expiryDate, quantity, imagePath));
                  },
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
                child:
                GestureDetector(
                  onTap: () {
                    // コンテナがタップされたときの処理をここに記述


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
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
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
                  textcolor: Color(0xFF72777A),
                ),
              ),
              Positioned(
                top: 300,
                child: GestureDetector(
                  onTap: _selectExpiryDate, // GestureDetectorでonTapを使います。
                  child: CustomDropdownButton(
                    hint: '賞味期限:${expiryDate != null ? expiryDate!.split(' ')[0] : ""}',
                    items: [/* 他のドロップダウンアイテム */],

                    onChanged: (String? value) {
                      setState(() {
                        expiryDate = value;
                      });
                    },
                    value: expiryDate,
                    buttonWidth: 230,
                    buttonHeight: 40,
                    textSize: 20,
                    textcolor: Color(0xFF72777A),
                    borderRadius: 30,
                  ),
                ),
              ),
              Positioned(
                top: 350,
                child: Column(
                  children: [
                    if (!showInputFields)
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showInputFields = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '詳細設定',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF72777A),
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
                      ),

                    if(showInputFields)
                      CustomTextField(
                        hintText: '名前:馬肉',
                        width: 230,
                        height: 40,
                        borderRadius: 30,
                        textSize: 20,
                        textAlign: TextAlign.start,
                        onChanged: (value) {
                          setState(() {
                            foodName = value;
                          });
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
                        textAlign: TextAlign.start,
                        onChanged: (value) {
                          setState(() {
                            quantity = value;
                          });
                        },
                      ),
                    SizedBox(height: 10),
                    if (showInputFields)
                      CustomTextField(
                        hintText: 'メモ:',
                        width: 230,
                        height: 80,
                        textSize: 20,
                        textAlign: TextAlign.start,
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
