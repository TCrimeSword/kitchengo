import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kitchen_go/constants/route_name.dart';
import 'package:kitchen_go/models/todo.dart';
import 'package:kitchen_go/providers/recipe_provider.dart';
import 'package:kitchen_go/widgets/layouts/layout.dart';
import 'package:provider/provider.dart';

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
        selectedIndex: RouteName.listIngredientScreenIndex,
        child: Consumer<RecipeProvider>(builder: (context, data, _) {
          return Container(
              padding: EdgeInsets.fromLTRB(40, 16, 30, 0),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Text(
                    'Danh sách mua sắm',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    ...data.listTodo.map((item) => buildTodo(item)).toList(),
                  ]),
                ],
              )));
        }));
  }

  buildTodo(Todo todo) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Provider.of<RecipeProvider>(context, listen: false)
                  .checkDoneTodo(todo.ingredient.name);
            },
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.green),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: todo.isDone
                    ? Icon(
                        Icons.check,
                        size: 30.0,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        size: 30.0,
                        color: Colors.green,
                      ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '${todo.ingredient.amount} ${todo.ingredient.unit} ${todo.ingredient.name}',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
