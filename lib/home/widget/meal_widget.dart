import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lina/meal/meal_screen.dart';

import '../../cores/models/meal_model.dart';
import '../style/color.dart';

class MealWidget extends StatelessWidget {
  final MealModel meal;
  const MealWidget({Key? key, required this.meal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = getBgColor();
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>MealScreen(meal: meal, mealColor: Color(color))));
      },
      child: Container(
        height: 450,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(color),
            border: Border.fromBorderSide(BorderSide(color: Color(color)))),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Hero(
              tag: meal.mealImage,
              child: Container(
                height: 340,
                width: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        meal.mealImage,
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              meal.mealName,
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  fontFamily: "Poppins"),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  int getBgColor() {
    return HomeColor.mealBgColors[Random.secure().nextInt(4)];
  }
}
