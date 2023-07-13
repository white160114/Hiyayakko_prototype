import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  final List<Image> images = [

  ]; // 画像のリスト
  final List<ColorFilter> colorFilters; // 画像ごとのColorFilterのリスト
  final double imageSize; // 画像の大きさ
  final double spacing;
  final double horizontalSpacing; // 画像同士の横間隔
  final double marginBottom; // 下の余白
  final List<VoidCallback> onTapCallbacks; // 画像ごとの onTap コールバックのリスト

  CustomNavbar({
    required this.colorFilters,
    required this.images,
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
