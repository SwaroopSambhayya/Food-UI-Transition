import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ui_transition/home/components/animate_text.dart';
import 'package:food_ui_transition/home/models/food_detail.dart';
import 'package:food_ui_transition/home/providers/transition_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class Food extends ConsumerStatefulWidget {
  final FoodDetail foodDetail;
  final PageController pageController;
  const Food(
      {super.key, required this.foodDetail, required this.pageController});

  @override
  ConsumerState<Food> createState() => _FoodState();
}

class _FoodState extends ConsumerState<Food> with TickerProviderStateMixin {
  late AnimationController _controller;
  int? reverseIndex;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        lowerBound: 0,
        upperBound: 1);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    reverseIndex = ref.watch(textAnimationIndex);

    if (reverseIndex != null && reverseIndex == widget.pageController.page) {
      _controller.reverse().then((value) => _controller.forward());
    }

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AnimateText(
                "DAILY COOKING QWEST",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
                controller: _controller,
                autoPlay: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Hero(
                tag: widget.foodDetail.title!,
                child: Material(
                  type: MaterialType.transparency,
                  child: AnimateText(
                    widget.foodDetail.title!,
                    style: GoogleFonts.ibmPlexSerif().copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: widget.foodDetail.textColor,
                    ),
                    controller: _controller,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ...widget.foodDetail.attributes!.map(
              (data) => AnimatedTile(controller: _controller, data: data),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: AnimateText(
                    widget.foodDetail.description!,
                    style: TextStyle(
                      fontSize: 12,
                      color: widget.foodDetail.textColor,
                    ),
                    controller: _controller,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedTile extends StatelessWidget {
  final Attribute data;
  final bool animate;
  final AnimationController? controller;
  const AnimatedTile(
      {super.key, required this.data, this.controller, this.animate = true});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        leading: Hero(tag: data.icon, child: data.icon),
        title: Hero(
          tag: data.title,
          child: Material(
            type: MaterialType.transparency,
            child: animate
                ? AnimateText(
                    data.title,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                    controller: controller!,
                  )
                : Text(
                    data.title,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ),
    );
  }
}
