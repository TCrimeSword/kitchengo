import 'package:flutter/material.dart';
import 'package:kitchen_go/constants/colors.dart';
import 'package:kitchen_go/models/ingredient.dart';

class MealPreparation extends StatelessWidget {
  MealPreparation(
      {super.key,
      required this.mealCount,
      required this.increaseMealCount,
      required this.decreaseMealCount,
      required this.listIngredient});
  List<Ingredient> listIngredient;
  int mealCount;
  Function increaseMealCount;
  Function decreaseMealCount;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 15,
            ),
            child: Row(children: [
              const Text(
                'Khẩu phần ăn ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Exo'),
              ),
              Ink(
                decoration: ShapeDecoration(
                    color: Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: IconButton(
                  icon: Icon(Icons.remove),
                  color: ColorConstant.BlueBoldColor,
                  onPressed: () => decreaseMealCount(),
                  iconSize: 25,
                ),
              ),
              Text(
                mealCount.toString(),
                style: TextStyle(fontSize: 18),
              ),
              Ink(
                decoration: ShapeDecoration(
                    color: Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: ColorConstant.BlueBoldColor,
                  onPressed: () => increaseMealCount(),
                  iconSize: 25,
                ),
              ),
            ]),
          ),
          Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
              ),
              child: Row(children: const [
                Text(
                  'Nguyên liệu chuẩn bị',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Exo'),
                ),
              ])),
          Column(
            children: [
              ...listIngredient
                  .map(
                    (e) => Container(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.name,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Exo'),
                          ),
                          Text(
                            '${e.amount * mealCount} ${e.unit!}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Exo'),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
        ],
      ),
    );
  }
}
