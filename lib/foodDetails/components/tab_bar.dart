import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_ui_transition/foodDetails/components/ingredients.dart';
import 'package:food_ui_transition/foodDetails/components/methods.dart';

class ReciepeTab extends StatefulWidget {
  final List<String> ingredients;
  final AnimationController controller;
  final Color textColor;
  const ReciepeTab(
      {super.key,
      required this.ingredients,
      required this.textColor,
      required this.controller});

  @override
  State<ReciepeTab> createState() => _ReciepeTabState();
}

class _ReciepeTabState extends State<ReciepeTab> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: const Color(0xff45C37B),
          unselectedLabelColor: Colors.grey.withOpacity(0.75),
          labelColor: widget.textColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.w500),
          controller: _tabController,
          tabs: const [
            Tab(text: "INGREDIENTS"),
            Tab(text: "METHOD"),
          ],
        ),
        Flexible(
          child: TabBarView(controller: _tabController, children: [
            Ingredients(
                ingredients: widget.ingredients,
                textColor: widget.textColor,
                animationController: widget.controller),
            const Methods()
          ]),
        )
      ],
    )
        .animate(controller: widget.controller)
        .slideY(begin: 1, end: 0, curve: Curves.easeIn);
  }
}
