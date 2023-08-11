import 'package:flutter/material.dart';
import 'package:food_ui_transition/foodDetails/components/ingredients.dart';
import 'package:food_ui_transition/foodDetails/components/methods.dart';

class ReciepeTab extends StatefulWidget {
  final List<String> ingredients;
  final Color textColor;
  const ReciepeTab(
      {super.key, required this.ingredients, required this.textColor});

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
            ),
            const Methods()
          ]),
        )
      ],
    );
  }
}
