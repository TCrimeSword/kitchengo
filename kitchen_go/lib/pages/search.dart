import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kitchen_go/constants/colors.dart';
import '../widgets/new_food.dart';
import '../widgets/search_widgets/categories.dart';
import '../widgets/search_widgets/errors.dart';
import '../widgets/search_widgets/find_more.dart';
import '../widgets/search_widgets/food_of_category.dart';
import '../widgets/search_widgets/found.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            //shadowColor: Color.fromARGB(255, 22, 58, 143),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                ColorConstant.BlueMediumColor,
                ColorConstant.BlueBoldColor
              ], begin: Alignment.bottomLeft, end: Alignment.bottomRight)),
            ),
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // The search area here
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      iconColor: Colors.black,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          /* Clear the search field */
                        },
                      ),
                      // hintText: 'Search...',
                      border: InputBorder.none),
                ),
              ),
            )),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoundFood(),
            FoundMore(),
            Categories(),
            Errors(),
            FoodOfCategory()
          ],
        )));
  }
}
