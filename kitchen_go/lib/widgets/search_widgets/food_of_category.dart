import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kitchen_go/widgets/new_food.dart';

import '../../constants/colors.dart';

class FoodOfCategory extends StatelessWidget {
  const FoodOfCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Row(children: [
                Text(
                  'Thể loại',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Exo'),
                ),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios), onPressed: () {})
              ])),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(5, 10, 10, 0)),
                      NewFood()
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
