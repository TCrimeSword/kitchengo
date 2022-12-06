import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_chickengo_husc/constants/route_name.dart';
import 'package:mobile_chickengo_husc/screens/home/blog.dart';
import 'package:mobile_chickengo_husc/screens/home/homepage.dart';
import 'package:mobile_chickengo_husc/screens/home/list.dart';
import 'package:mobile_chickengo_husc/screens/home/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kitchen Go',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.homeScreen,
      routes: {
        RouteName.homeScreen: (context) => const HomePage(),
        RouteName.blogScreen: (context) => BlogPage(),
        RouteName.listIngredientScreen: (context) => const ListIngredientPage(),
        RouteName.userScreen: (context) => const UserPage(),
      },
    );
  }
}
