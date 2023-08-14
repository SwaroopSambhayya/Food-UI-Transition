import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ui_transition/const.dart';
import 'package:food_ui_transition/foodDetails/details.dart';
import 'package:food_ui_transition/home/providers/transition_provider.dart';
import 'package:food_ui_transition/home/utils/utils.dart';

class RotateFood extends ConsumerStatefulWidget {
  const RotateFood({
    super.key,
    required this.currentIndex,
    required this.width,
    required this.pageController,
  });
  final PageController pageController;
  final int currentIndex;
  final double width;

  @override
  ConsumerState<RotateFood> createState() => _RotateFoodState();
}

class _RotateFoodState extends ConsumerState<RotateFood>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  double? lastAnimatedValue;
  Curve animationType = Curves.easeOutBack;

  @override
  void initState() {
    super.initState();
    _rotationController =
        AnimationController(vsync: this, upperBound: 1, lowerBound: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _rotationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToDetail(foodList[widget.currentIndex], context),
      onVerticalDragUpdate: (details) async {
        if (details.delta.dy <= 0) {
          if (!_rotationController.isAnimating) {
            if (widget.currentIndex < foodList.length - 1) {
              setState(() {
                animationType = Curves.easeOutBack;
              });
              Future.delayed(const Duration(milliseconds: 500), () {});

              ref.read(textAnimationIndex.notifier).state = widget.currentIndex;
              widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
              _rotationController.loop(count: 1, max: 1);
              lastAnimatedValue = 1;
            }
          }
        } else {
          if (!_rotationController.isAnimating) {
            if (widget.currentIndex > 0) {
              setState(() {
                animationType = Curves.easeInBack;
              });
              widget.pageController.previousPage(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);

              if (widget.currentIndex > 0) {
                lastAnimatedValue = 1;
              }

              _rotationController.reverse(from: lastAnimatedValue);
              lastAnimatedValue = 0;
            }
          }
        }
      },
      child: Hero(
        tag: foodList[widget.currentIndex].pictureAlt!,
        flightShuttleBuilder: (flightContext, animation, flightDirection,
            fromHeroContext, toHeroContext) {
          return Image.asset(
            flightDirection.name == "push"
                ? "lib/assets/${foodList[widget.currentIndex].pictureAlt}"
                : "lib/assets/${foodList[widget.currentIndex].picture}",
            width: flightDirection.name == "push"
                ? widget.width * 0.80
                : widget.width * 0.88,
          ).animate().rotate(
                begin: flightDirection.name == 'push' ? 1 : -1,
                end: 0,
                curve: flightDirection.name == 'push'
                    ? Curves.fastOutSlowIn
                    : Curves.fastEaseInToSlowEaseOut,
                duration: const Duration(milliseconds: 600),
              );
        },
        child: Image.asset(
          "lib/assets/${foodList[widget.currentIndex].picture}",
          width: widget.width * 0.88,
        )
            .animate(
              controller: _rotationController,
              autoPlay: false,
            )
            .rotate(
                duration: const Duration(milliseconds: 1200),
                alignment: Alignment.center,
                curve: animationType,
                begin: lastAnimatedValue == _rotationController.upperBound
                    ? -_rotationController.upperBound
                    : _rotationController.lowerBound,
                end: lastAnimatedValue == _rotationController.upperBound
                    ? 0
                    : _rotationController.upperBound),
      ),
    )
        .animate()
        .rotate(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            begin: 0,
            end: 0.2)
        .then()
        .rotate(
            begin: 0,
            end: -0.2,
            curve: Curves.easeOutBack,
            duration: const Duration(milliseconds: 500));
  }
}
