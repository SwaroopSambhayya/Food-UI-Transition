import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_ui_transition/const.dart';

class Ingredients extends StatelessWidget {
  final List<String> ingredients;
  final AnimationController animationController;
  final Color textColor;
  const Ingredients(
      {super.key,
      required this.ingredients,
      required this.textColor,
      required this.animationController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return CheckboxListTile.adaptive(
          value: false,
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          onChanged: (val) {},
          title: Text(
            ingredients[index],
            style: TextStyle(color: textColor),
          ),
        )
            .animate(
              controller: animationController,
            )
            .then(delay: Duration(milliseconds: 300 + index * 50))
            .slideY(
                begin: 1.4,
                end: 0,
                duration: const Duration(
                  milliseconds: 300,
                ),
                curve: Curves.easeOutBack);
      },
      itemCount: ingredients.length,
    );
  }
}
