import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/route_name.dart';
import 'package:kitchen_go/pages/blog.dart';
import 'package:kitchen_go/pages/home.dart';
import 'package:kitchen_go/pages/list.dart';
import 'package:kitchen_go/pages/splash.dart';
import 'package:kitchen_go/pages/user.dart';
import 'package:kitchen_go/providers/account_provider.dart';
import 'package:kitchen_go/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RecipeProvider()),
          ChangeNotifierProvider(create: (_) => AccountProvider()),
        ],
        child: MaterialApp(
          title: 'Kitchen GO',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Exo',
          ),
          initialRoute: RouteName.splashScreen,
          routes: {
            RouteName.splashScreen: (context) => const SplashPage(),
            RouteName.homeScreen: (context) => const HomePage(),
            RouteName.blogScreen: (context) => const BlogPage(),
            RouteName.listIngredientScreen: (context) =>
                const ListIngredientPage(),
            RouteName.userScreen: (context) => const UserPage(),
          },
        ));
  }
}
