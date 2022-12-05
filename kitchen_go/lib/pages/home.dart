import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/route_name.dart';
import 'package:kitchen_go/widgets/layouts/layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      bgColor: Colors.blue,
      selectedIndex: RouteName.homeScreenIndex,
      child: Container(child: Text('HomePage')),
    );
  }
}
