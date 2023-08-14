import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimateText extends StatelessWidget {
  final TextStyle style;
  final String data;
  final bool autoPlay;
  final AnimationController controller;
  const AnimateText(this.data,
      {super.key,
      required this.style,
      required this.controller,
      this.autoPlay = false});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: style)
        .animate(controller: controller, autoPlay: autoPlay)
        .fade()
        .slideY(
          begin: -1,
          end: 0,
          duration: const Duration(milliseconds: 300),
        );
  }
}
