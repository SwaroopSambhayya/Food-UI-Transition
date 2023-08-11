import 'package:flutter/material.dart';
import 'package:food_ui_transition/foodDetails/components/tab_bar.dart';
import 'package:food_ui_transition/home/components/food.dart';
import 'package:food_ui_transition/home/models/food_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class FoodRecipe extends StatelessWidget {
  final FoodDetail detail;
  const FoodRecipe({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: detail.colorScheme!.background,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            UniconsLine.arrow_left,
            size: 30,
            color: detail.textColor,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Hero(
                    tag: detail.pictureAlt!,
                    child: Image.asset('lib/assets/${detail.pictureAlt}')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Hero(
                tag: detail.title!,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    detail.title!,
                    style: GoogleFonts.ibmPlexSerif().copyWith(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: detail.textColor,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: AnimatedTile(
                    data: detail.attributes![1],
                    animate: false,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    child: AnimatedTile(
                      data: detail.attributes![3],
                      animate: false,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ReciepeTab(
                textColor: detail.textColor!,
                ingredients: detail.ingredients ?? [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
