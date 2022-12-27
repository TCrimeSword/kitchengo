import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MealCount extends StatelessWidget {
  const MealCount({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 20, left: 25),
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
                    onPressed: () {},
                    iconSize: 25,
                  ),
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
                    onPressed: () {},
                    iconSize: 25,
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}
