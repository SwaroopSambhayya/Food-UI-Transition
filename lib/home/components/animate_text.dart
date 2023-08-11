import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimateText extends StatelessWidget {
  final TextStyle style;
  final String data;
  final AnimationController controller;
  const AnimateText(this.data,
      {super.key, required this.style, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: style)
        .animate(controller: controller, autoPlay: false)
        .fade()
        .slideY(
          begin: -1,
          end: 0,
          duration: const Duration(milliseconds: 300),
        );
  }
}
