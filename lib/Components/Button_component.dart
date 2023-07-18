import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Navbar
class CustomNavbar extends StatelessWidget {
  final List<Image> images = [
    Image(image: AssetImage('lib/Views/Images/minirefrigerator.png')),
    Image(image: AssetImage('lib/Views/Images/recipe.png')),
    Image(image: AssetImage('lib/Views/Images/home.png')),
    Image(image: AssetImage('lib/Views/Images/refopen.png')),
    Image(image: AssetImage('lib/Views/Images/account.png')),
  ]; // 画像のリスト
  final List<ColorFilter> colorFilters; // 画像ごとのColorFilterのリスト
  final double imageSize; // 画像の大きさ
  final double spacing;
  final double horizontalSpacing; // 画像同士の横間隔
  final double marginBottom; // 下の余白
  final List<VoidCallback> onTapCallbacks; // 画像ごとの onTap コールバックのリスト

  CustomNavbar({
    required this.colorFilters,
    this.imageSize = 60.0,
    this.spacing = 16,
    this.horizontalSpacing = 8,
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
            offset: Offset(1, 5),
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

//1ページ戻るボタン
class CustomBackButton extends StatelessWidget {
  final void Function() onPressed;

  const CustomBackButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: Color.fromARGB(255, 164, 237, 92),
        fixedSize: Size(50, 50), // ボタンの幅と高さを指定
        elevation: 10, // 影の大きさを指定
      ),
      onPressed: onPressed,
      child: Center(
        child: Icon(
          Icons.keyboard_return,
          size: 33, // アイコンのサイズを指定
        ),
      ),
    );
  }
}

//追加ボタン
class CustomAddButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double labelSize;

  const CustomAddButton({
    required this.onPressed,
    this.label = '追加',
    this.labelSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF6AAB2A),
            ),
            child: Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: labelSize,
              color: Color(0xFF6AAB2A),
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFE1E1E1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        fixedSize: Size(110, 45),
      ),
    );
  }
}

//カテゴリー
class CategoryWidget extends StatelessWidget {
  final String name;
  final String category;
  final String expiryDate;
  final String quantity;
  final String imagePath;

  CategoryWidget({
    required this.name,
    required this.category,
    required this.expiryDate,
    required this.quantity,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 30,),
              Image.asset(
                imagePath,
                width: 75,
                height: 75,
              ),
              SizedBox(width: 0,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 25,),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Expanded(
                          child: Text(
                            '名前: $name',
                          ),
                        ),
                        SizedBox(width: 0,),
                        Expanded(
                          child: Text('カテゴリー: $category'),
                        ),
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Text(
                          '賞味期限: $expiryDate',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text('量: $quantity'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 0,),
          Divider(
            thickness: 1.3,
            indent: 25,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
