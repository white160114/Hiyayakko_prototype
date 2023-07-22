import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Colors_component.dart';

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
        elevation: 10,
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
    return GestureDetector(
        onTap: (){
      Navigator.pushNamed(context, '/detail');
    },
    child:Container(
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
    ),
    );
  }
}

//完了ボタン
class CompleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  CompleteButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: Colors_component.gold,
            ),
            SizedBox(width: 10),
            Text(
              '完了',
              style: TextStyle(
                fontSize: 15,
                color: Colors_component.gold,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFE1E1E1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          fixedSize: Size(105, 30),
        ),
      ),
    );
  }
}

//選択ボックスのクラス
class CustomDropdownButton extends StatefulWidget {
  final String hint;  // 初期表示文字
  final List<DropdownMenuItem<String>> items;   // 選択肢のリスト
  final ValueChanged<String?> onChanged;  //
  final String? value;
  final double buttonWidth;  // ボタンの幅
  final double buttonHeight;  // ボタンの高さ
  final double textSize;  // 文字の大きさ
  final double borderRadius;
  final textcolor;
  final TextAlign hintTextAlign;
  final double shadowBlurRadius; // 影のぼかし半径
  final double shadowSpreadRadius; // 影の広がり半径
  final Offset? shadowOffset; // 影のオフセット
  final Color? shadowColor; // 影の色


  CustomDropdownButton({
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    this.buttonWidth = 270,
    this.buttonHeight = 60,
    this.textSize = 16,
    this.borderRadius = 16,
    this.textcolor = Colors.black,
    this.hintTextAlign = TextAlign.center,
    this.shadowBlurRadius = 0.0, // 影なしにするために0.0に設定
    this.shadowSpreadRadius = 0.0, // 影なしにするために0.0に設定
    this.shadowOffset, // 追加：影のオフセット
    this.shadowColor, // 影なしにするためにnullに設定
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
      width: widget.buttonWidth,   // ボタンの横幅
      height: widget.buttonHeight,   // ボタンの縦幅
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black12,  // 枠線の色
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(widget.borderRadius),  // 角丸の半径
        boxShadow: widget.shadowColor != null
            ? [
          BoxShadow(
            color: widget.shadowColor!,
            blurRadius: widget.shadowBlurRadius,
            spreadRadius: widget.shadowSpreadRadius,
            offset: widget.shadowOffset ?? Offset.zero,
          ),
        ]
            : null, // 影がnullの場合はnullを設定
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            isExpanded: true,
            value: selectedValue,
            hint:
            Container(
              alignment: _convertTextAlignToAlignment(),
              child: Text(
                selectedValue ?? widget.hint,
                style: TextStyle(
                  fontSize: widget.textSize,
                  color: widget.textcolor,
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
                      fontSize: widget.textSize,  // 文字のサイズ
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
  AlignmentGeometry _convertTextAlignToAlignment() {
    switch (widget.hintTextAlign) {
      case TextAlign.center:
        return Alignment.center;
      case TextAlign.left:
        return Alignment.centerLeft;
      case TextAlign.right:
        return Alignment.centerRight;
      case TextAlign.justify:
      case TextAlign.start:
      case TextAlign.end:
        return Alignment.center;
    }
  }
}

//テキスト入力
class CustomTextField extends StatefulWidget {
  final String hintText;
  final double width;
  final double height;
  final double textSize;
  final ValueChanged<String>? onChanged;
  final double borderRadius;  //角のマルサ
  final TextAlign textAlign;
  final Color textcolor;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.width = 270,
    this.height = 60,
    this.textSize = 12,
    this.borderRadius =15,
    this.textAlign = TextAlign.center,
    this.textcolor = Colors.black,
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
        borderRadius: BorderRadius.circular(widget.borderRadius),
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
            textAlign: widget.textAlign,
            style: TextStyle(fontSize: widget.textSize),
          ),
        ),
      ),
    );
  }
}