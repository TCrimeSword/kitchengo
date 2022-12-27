import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/api.dart';
import 'package:kitchen_go/models/category.dart';
import 'package:kitchen_go/models/recipe.dart';
import 'package:kitchen_go/pages/detail/food_detail_cooking.dart';
import 'package:kitchen_go/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key, required this.category});
  Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Image(
              image: NetworkImage(Api.getImageUrl(category.image!)),
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: 250,
            ),
            buildTitle(),
            SizedBox(
              height: 20,
            ),
            buildListRecipe(context)
          ]),
        ),
      )),
    );
  }

  buildTitle() {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 10, 14, 0),
      child: Column(children: [
        Text(
          category.name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          category.descriptions ?? '',
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.justify,
        )
      ]),
    );
  }

  buildListRecipe(BuildContext context) {
    return Consumer<RecipeProvider>(builder: (context, data, _) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Công thức',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            // for (int i = 0; i < category.listRecipes!.length; i++)
            //   buildRecipeCard(Api.getImageUrl(category.listRecipes![i].image),
            //       category.listRecipes![i].title)
            for (int i = 0; i < category.listRecipes!.length; i++)
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodDetailCooking(
                              recipe: category.listRecipes![i],
                              listSuggestions: data.listRecipe,
                            )),
                  );
                },
                child: buildRecipeCard(category.listRecipes![i]),
              )
          ],
        ),
      );
    });
  }

  buildRecipeCard(Recipe recipe) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 234, 234, 234),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          Image(
            image: NetworkImage(Api.getImageUrl(recipe.image!)),
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            recipe.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  buildSuggestList() {
    return Container();
  }
}
