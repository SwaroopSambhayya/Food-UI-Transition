import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  final List<String> ingredients;
  final Color textColor;
  const Ingredients(
      {super.key, required this.ingredients, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: ingredients
              .map(
                (data) => CheckboxListTile.adaptive(
                  value: false,
                  controlAffinity: ListTileControlAffinity.leading,
                  dense: true,
                  onChanged: (val) {},
                  title: Text(
                    data,
                    style: TextStyle(color: textColor),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
