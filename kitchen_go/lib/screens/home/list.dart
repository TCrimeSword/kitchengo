import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_chickengo_husc/constants/route_name.dart';
import 'package:mobile_chickengo_husc/widgets/layouts/layout.dart';

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
