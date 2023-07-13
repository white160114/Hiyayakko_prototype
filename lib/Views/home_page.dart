import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_ref_welcome_page.dart';

class HomePage extends StatelessWidget {
  final String? refname;
  HomePage({this.refname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80),
          Container(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  // 下線の位置が下からどれくらい離れているか(0で1番離れる)
                  bottom: 1,
                  child: Container(
                    height: 2,  //下線の太さ
                    decoration: BoxDecoration(
                        color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(0,2),
                        ),
                      ]
                    ),
                  ),
                ),
              Text(
                '$refnameの冷蔵庫',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
            ),
            padding: EdgeInsets.only(left: 100,right: 0), // 左右のパディングを設定
          ),
          SizedBox(height: 50), //冷蔵庫の位置高さ変わる
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'lib/Views/Images/refrigerator.png',
                width: 470,
                height: 470,
              ),
            ),
          ),
          SizedBox(height: 10),
          CustomNavbar(
            images: [
              Image.asset('lib/Views/Images/minirefrigerator.png'),
              Image.asset('lib/Views/Images/recipe.png'),
              Image.asset('lib/Views/Images/home.png'),
              Image.asset('lib/Views/Images/refopen.png'),
              Image.asset('lib/Views/Images/account.png'),
            ],
            colorFilters: [
              ColorFilter.mode(Colors.white,BlendMode.modulate),
              ColorFilter.mode(Colors.white,BlendMode.modulate),
              ColorFilter.mode(Colors.brown,BlendMode.modulate),
              ColorFilter.mode(Colors.white,BlendMode.modulate),
              ColorFilter.mode(Colors.white,BlendMode.modulate),
            ],
            onTapCallbacks: [
                  () {
                // 1番目の画像がタップされたときの処理
                Navigator.pushNamed(context, "/welcomeRef");
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
    );
  }
}





class CustomNavbar extends StatelessWidget {
  final List<Image> images; // 画像のリスト
  final List<ColorFilter> colorFilters; // 画像ごとのColorFilterのリスト
  final double imageSize; // 画像の大きさ
  final double spacing;
  final double horizontalSpacing; // 画像同士の横間隔
  final double marginBottom; // 下の余白
  final List<VoidCallback> onTapCallbacks; // 画像ごとの onTap コールバックのリスト

  CustomNavbar({
    required this.images,
    required this.colorFilters,
    this.imageSize = 60.0,
    this.spacing = 16,
    this.horizontalSpacing = 4.0,
    this.marginBottom = 40.0,
    required this.onTapCallbacks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      margin: EdgeInsets.only(bottom: marginBottom),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        color: Color.fromARGB(255, 164, 237, 92),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(1, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          images.length,
              (index) => Column(
            children: [
              SizedBox(height: 15),
              GestureDetector(
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  child: ColorFiltered(
                    colorFilter: colorFilters[index], // 画像ごとのColorFilterを指定
                    child: images[index],
                  ),
                ),
                onTap: onTapCallbacks[index], // 画像ごとの onTap コールバックを設定
              ),
              SizedBox(height: 15),
            ],
          ),
        )
            .expand(
              (widget) => [
            widget,
            SizedBox(width: horizontalSpacing),
          ],
        )
            .toList(),
      ),
    );
  }
}
