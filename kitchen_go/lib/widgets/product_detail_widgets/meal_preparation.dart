import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MealPreparation extends StatelessWidget {
  const MealPreparation({super.key});

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
              child: Row(children: const [
                Text(
                  'Nguyên liệu chuẩn bị',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Exo'),
                ),
              ])),
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.only(left: 20, top: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Xì dầu",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
                Text(
                  "30ml",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.only(left: 20, top: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Rượu mirin",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
                Text(
                  "30ml",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.only(left: 20, top: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Trứng",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
                Text(
                  "3 quả",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.only(left: 20, top: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Bột mì",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
                Text(
                  "100g",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.only(left: 20, top: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Bột mì",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
                Text(
                  "100g",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.only(left: 20, top: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Hành lá",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
                Text(
                  "100g",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.only(left: 20, top: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Muối ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
                Text(
                  "1 thìa cà phê",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.only(left: 20, top: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Tiêu",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
                Text(
                  "1/2 thìa cà phê",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.amber,
            padding: const EdgeInsets.only(left: 20, top: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Đường",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
                Text(
                  "2 thìa canh",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
