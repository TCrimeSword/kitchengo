import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/route_name.dart';
import 'package:kitchen_go/pages/category.dart';
import 'package:kitchen_go/pages/search.dart';
import 'package:kitchen_go/providers/account_provider.dart';
import 'package:kitchen_go/providers/recipe_provider.dart';
import 'package:kitchen_go/widgets/favorite_food.dart';
import 'package:kitchen_go/widgets/layouts/layout.dart';
import 'package:kitchen_go/widgets/recently_viewed.dart';
import 'package:provider/provider.dart';

import '../icons/my_flutter_app_icons.dart';
import '../widgets/new_food.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    var recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    recipeProvider.init();
  }

  String comment = "";
  @override
  Widget build(BuildContext context) {
    // return Layout(
    //     bgColor: Colors.blue,
    //     selectedIndex: RouteName.homeScreenIndex,
    //     child: Consumer<RecipeProvider>(builder: (context, data, _) {
    //       return Container(
    //           child: Column(
    //         children: [
    //           Text('Trang chủ'),
    //           ElevatedButton(
    //               onPressed: () {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                       builder: (context) => CategoryPage(
    //                             category: data.listCategory[0],
    //                           )),
    //                 );
    //               },
    //               child: Text('Qua trang category')),
    //         ],
    //       ));
    //     }));
    return Layout(
        bgColor: Colors.blue,
        selectedIndex: RouteName.homeScreenIndex,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => SearchPage()));
            },
          ),
        ],
        child: Consumer<RecipeProvider>(builder: (context, data, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: Row(
                    children: const [
                      Text(
                        'Mới xem gần đây',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Exo'),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                RecentlyViewed(
                  listRecipes: data.listRecipe,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: const [
                      Text(
                        'Nổi bật',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Exo'),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                FavoriteFood(
                  listCategory: data.listCategory,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: const [
                      Text(
                        'Mới nhất',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Exo'),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                NewFood(
                  listRecipes: data.listRecipe,
                )
              ],
            ),
          );
        }));
  }
}
