import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kitchen_go/constants/route_name.dart';
import 'package:kitchen_go/widgets/layouts/layout.dart';

class ListIngredientPage extends StatefulWidget {
  const ListIngredientPage({super.key});

  @override
  State<ListIngredientPage> createState() => _ListIngredientPageState();
}

class _ListIngredientPageState extends State<ListIngredientPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
        bgColor: Colors.green,
        child: Container(child: Text('Danh sách nguyên liệu')),
        selectedIndex: RouteName.listIngredientScreenIndex);
  }
}
