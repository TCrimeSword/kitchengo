import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/route_name.dart';
import 'package:kitchen_go/pages/category.dart';
import 'package:kitchen_go/providers/account_provider.dart';
import 'package:kitchen_go/providers/recipe_provider.dart';
import 'package:kitchen_go/widgets/layouts/layout.dart';
import 'package:provider/provider.dart';

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
    return Layout(
        bgColor: Colors.blue,
        selectedIndex: RouteName.homeScreenIndex,
        child: Consumer<RecipeProvider>(builder: (context, data, _) {
          return Container(
              child: Column(
            children: [
              Text('Trang chủ'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryPage(
                                category: data.listCategory[0],
                              )),
                    );
                  },
                  child: Text('Qua trang category')),
            ],
          ));
        }));
  }
}
