import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Button_component.dart';
import '../Components/Colors_component.dart';

class MeatPage extends StatelessWidget{
  Map<dynamic, dynamic> inRef;
  MeatPage({required this.inRef, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 30, top: 40, right: 10),
                    child: CustomBackButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    )
                ),
                SizedBox(width: 40,),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(Colors.red, BlendMode.modulate), // 適用するColorFilterを指定
                    child: Image.asset(
                      'lib/Views/Images/meat.png',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    '肉',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors_component.titleColor,
                    ),
                  ),
                ),
                SizedBox(width: 45,),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child:CustomAddButton(
                      onPressed: (){
                        Navigator.pushNamed(context, "get/add_category");
                      },
                  )
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child:Align(
              alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/detail');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.sort,
                    color: Colors.white,
                  ),
                  SizedBox(width: 0,),
                  Text(
                    '絞り込み',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF80BD33),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: Size(90, 40),
              ),
            ),
          )
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: inRef.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return CategoryWidget(
                  foodName: inRef[index]["name"],
                  category: inRef[index]["categoryName"],
                  expiryDate: inRef[index]["limitDay"],
                  quantity: inRef[index]["amount"],
                  imagePath: 'lib/Views/Images/' + inRef[index]["imageName"],
                );
              },
            ),
          ),
          SizedBox(height: 100,),
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
                    Navigator.pushNamed(context, '/home');
              },
                  () {
                // 4番目の画像がタップされたときの処理
              },
                  () {
                // 5番目の画像がタップされたときの処理
              },
            ],
          )
        ],
      ),
    );
  }
}