import 'package:flutter/material.dart';
import 'dart:math';

import 'package:lina/home/style/color.dart';

class MealWidget extends StatelessWidget {
  final String mealImage;
  final String mealName;
  const MealWidget({Key? key, required this.mealImage, required this.mealName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = getBgColor();
    return Container(
      height: 450,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(color),
          border:
              Border.fromBorderSide(BorderSide(color: Color(color)))),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 340,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  mealImage,
                ),
              )
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            mealName,
            style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                fontFamily: "Poppins"),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  int getBgColor() {
    return HomeColor.mealBgColors[Random.secure().nextInt(4)];
  }
}
