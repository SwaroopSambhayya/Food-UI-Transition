import 'package:flutter/material.dart';
import 'package:food_ui_transition/foodDetails/details.dart';
import 'package:food_ui_transition/home/models/food_detail.dart';

navigateToDetail(FoodDetail food, BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder<void>(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: animation.value,
                child: FoodRecipe(
                  detail: food,
                ),
              );
            });
      },
      transitionDuration: const Duration(milliseconds: 800),
      reverseTransitionDuration: const Duration(milliseconds: 500),
    ),
  );
}
