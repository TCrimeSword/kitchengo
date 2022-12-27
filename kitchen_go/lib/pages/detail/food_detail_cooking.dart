import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/colors.dart';
import 'package:kitchen_go/models/recipe.dart';
import 'package:kitchen_go/widgets/product_detail_widgets/author_detail.dart';
import 'package:kitchen_go/widgets/product_detail_widgets/comments.dart';
import 'package:kitchen_go/widgets/product_detail_widgets/description_food.dart';
import 'package:kitchen_go/widgets/product_detail_widgets/food_title.dart';
import 'package:kitchen_go/widgets/product_detail_widgets/introduction_cooking.dart';
import 'package:kitchen_go/widgets/product_detail_widgets/meal_count.dart';
import 'package:kitchen_go/widgets/product_detail_widgets/meal_preparation.dart';
import 'package:kitchen_go/widgets/product_detail_widgets/time_preparation.dart';
import 'package:kitchen_go/widgets/recently_viewed.dart';

class FoodDetailCooking extends StatefulWidget {
  FoodDetailCooking(
      {super.key, required this.recipe, required this.listSuggestions});
  Recipe recipe;
  List<Recipe> listSuggestions;
  @override
  State<FoodDetailCooking> createState() => _FoodDetailCookingState();
}

class _FoodDetailCookingState extends State<FoodDetailCooking> {
  int mealCount = 1;
  void increaseMealCount() {
    setState(() {
      mealCount++;
    });
  }

  void descreaseMealCount() {
    if (mealCount > 1) {
      setState(() {
        mealCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        //shadowColor: Color.fromARGB(255, 22, 58, 143),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            ColorConstant.BlueMediumColor,
            ColorConstant.BlueBoldColor
          ], begin: Alignment.bottomLeft, end: Alignment.bottomRight)),
        ),
        title: Text(
          widget.recipe.title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FoodTitle(
              title: widget.recipe.title,
              image: widget.recipe.image!,
            ),
            AuthorDetail(
              authorName: widget.recipe.author!.username,
            ),
            DescriptioinFood(
              description: widget.recipe.description ?? '',
            ),
            const TimePreparation(),
            Container(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Row(children: const [
                  Text(
                    'Nguyên liệu',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Exo'),
                  ),
                ])),
            // MealCount(),
            MealPreparation(
              listIngredient: widget.recipe.ingredients ?? [],
              mealCount: mealCount,
              increaseMealCount: increaseMealCount,
              decreaseMealCount: descreaseMealCount,
            ),
            Container(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Row(children: const [
                  Text(
                    'Hướng dẫn cách làm ',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Exo'),
                  ),
                ])),
            Container(
              width: 380,
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Column(
                children: [
                  IntroductionCooking(
                    steps: widget.recipe.steps ?? [],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    height: 60,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Bắt đầu nấu nào",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Exo'),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            ColorConstant.BlueBoldColor,
                            ColorConstant.BlueMediumColor,
                          ]),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 15.0,
                            offset: const Offset(
                                0.0, 0.75) // changes position of shadow
                            ),
                      ],
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: Row(children: const [
                        Text(
                          'Bình luận',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Exo'),
                        ),
                      ])),
                  const SizedBox(
                    height: 20,
                  ),
                  Comments(
                    listComment: widget.recipe.comments ?? [],
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 20, left: 5),
                      child: Row(children: const [
                        Text(
                          'Gợi ý  ',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Exo'),
                        ),
                      ])),
                  RecentlyViewed(
                    listRecipes: widget.listSuggestions,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
